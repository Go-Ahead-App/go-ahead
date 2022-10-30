# frozen_string_literal: true

# Add an invite_code column to the users table.
class AddInviteCodeToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :invite_code, :string
  end
end
