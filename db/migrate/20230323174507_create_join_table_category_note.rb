# frozen_string_literal: true

# Create a join table called categories_notes that has a foreign key for categories and notes.
class CreateJoinTableCategoryNote < ActiveRecord::Migration[7.1]
  def change
    create_join_table :categories, :notes do |t|
      t.index [:category_id, :note_id]
    end
  end
end
