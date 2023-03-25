# frozen_string_literal: true

# This class inherits from ActiveRecord::Migration and has a change method that creates a table called
# events with a name column and a foreign key to the enrolled_programs table
class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name
      t.references :enrolled_program, null: false, foreign_key: true

      t.timestamps
    end
  end
end
