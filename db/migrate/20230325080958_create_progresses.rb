# frozen_string_literal: true

# This class creates a table called progresses, which has a boolean column called completed, a user_id
# column, an enrolled_program_id column, and an event_id column
class CreateProgresses < ActiveRecord::Migration[7.1]
  def change
    create_table :progresses do |t|
      t.boolean :completed
      t.references :user, null: false, foreign_key: true
      t.references :enrolled_program, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
