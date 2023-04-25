# frozen_string_literal: true

# This is a decorator class that uses a service object to parse and display the description of a
# program.
class ProgramDecorator < Draper::Decorator
  delegate_all

  def display_description
    parsed = MarkupParserService.new(object.description).call

    parsed ? parsed.html_safe : ''
  end

  def display_difficulty
    case object.difficulty
    when 0
      'Легко'
    when 1
      'Середнє'
    when 2
      'Складно'
    else
      'Невідомо'
    end
  end

  def display_length
    "#{object.length} днів"
  end
end
