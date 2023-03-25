# frozen_string_literal: true

# This class inherits from ActiveRecord::Migration and has a change method that creates a table called
# actions with a name, description, and challenge_id
class CreateActions < ActiveRecord::Migration[7.1]
  def change
    create_table :actions do |t|
      t.string :name
      t.text :description
      t.references :challenge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
