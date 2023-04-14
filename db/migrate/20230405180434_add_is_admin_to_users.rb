# frozen_string_literal: true

# This is a Ruby class that creates a migration to add a boolean column called "is_admin" to the
# "users" table in a database.
class AddIsAdminToUsers < ActiveRecord::Migration[7.1]
  def up
    add_column :users, :is_admin, :boolean, default: false
  end

  def down
    remove_column :users, :is_admin
  end
end
