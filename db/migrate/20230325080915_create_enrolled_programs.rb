# frozen_string_literal: true

# This class creates a table called enrolled_programs that has a status, a user_id, and a program_id
class CreateEnrolledPrograms < ActiveRecord::Migration[7.1]
  def change
    create_table :enrolled_programs do |t|
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.references :program, null: false, foreign_key: true

      t.timestamps
    end
  end
end
