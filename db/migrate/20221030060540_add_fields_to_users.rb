# frozen_string_literal: true

# This class adds the name, username, bio, and birthday fields to the users table.
class AddFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :username, :string
    add_column :users, :bio, :text

    add_column :users, :birthday, :date
  end
end
