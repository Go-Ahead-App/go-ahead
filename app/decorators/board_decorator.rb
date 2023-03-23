# frozen_string_literal: true

# This class is a decorator for the Board class, and it delegates all methods to the Board class.
class BoardDecorator < Draper::Decorator
  delegate_all

  def columns
    if uncategorized(object.notes).empty?
      categorized(object.notes)
    else
      uncategorized(object.notes) + categorized(object.notes)
    end
  end

  private

  def categorized(notes)
    categories = notes.map(&:categories).flatten.uniq

    categories.map do |category|
      [
        category.name,
        notes.select { |note| note.categories.include?(category) }
      ]
    end
  end

  def uncategorized(notes)
    uncategorized = notes.select { |note| note.categories.empty? }

    [['Uncategorized', uncategorized]]
  end
end
