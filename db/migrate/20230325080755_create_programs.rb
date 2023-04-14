# frozen_string_literal: true

# This class inherits from ActiveRecord::Migration and has a change method that creates a table called
# programs with a name, description, difficulty, and length
class CreatePrograms < ActiveRecord::Migration[7.1]
  def change
    create_table :programs do |t|
      t.string :name
      t.text :description
      t.integer :difficulty
      t.integer :length

      t.timestamps
    end
  end
end
