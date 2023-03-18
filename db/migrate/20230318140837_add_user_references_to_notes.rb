# frozen_string_literal: true

# This migration adds a user_id column to the notes table and makes it a foreign key that references
# the id column of the users table.
class AddUserReferencesToNotes < ActiveRecord::Migration[7.1]
  def up
    add_reference :notes, :user, null: false, foreign_key: true
  end

  def down
    remove_reference :notes, :user
  end
end
