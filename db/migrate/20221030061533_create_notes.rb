# frozen_string_literal: true

# This class inherits from ActiveRecord::Migration and defines a change method that creates a table
# called notes with the following columns: title, description, content, and board_id
class CreateNotes < ActiveRecord::Migration[7.1]
  def change
    create_table :notes do |t|
      t.string :title
      t.string :description
      t.text :content
      t.references :board, null: false, foreign_key: true

      t.timestamps
    end
  end
end
