# frozen_string_literal: true

# This class inherits from ActiveRecord::Migration and has a change method that creates a table called
# exercises with a name, description, and activity_id column
class CreateExercises < ActiveRecord::Migration[7.1]
  def change
    create_table :exercises do |t|
      t.string :name
      t.text :description
      t.references :activity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
