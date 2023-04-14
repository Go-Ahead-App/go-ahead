# frozen_string_literal: true

# This class inherits from ActiveRecord::Migration and has a change method that creates a table called
# challenges with a name, description, and a reference to a program
class CreateChallenges < ActiveRecord::Migration[7.1]
  def change
    create_table :challenges do |t|
      t.string :name
      t.text :description
      t.references :program, null: false, foreign_key: true

      t.timestamps
    end
  end
end
