# frozen_string_literal: true

# This class creates a table called categories with a name and a reference to a note.
class CreateCategories < ActiveRecord::Migration[7.1]
  def up
    create_table :categories do |t|
      t.string :name
      t.references :note, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :categories
  end
end
