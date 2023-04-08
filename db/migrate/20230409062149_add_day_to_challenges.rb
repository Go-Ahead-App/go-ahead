# frozen_string_literal: true

# This is a Ruby ActiveRecord migration that adds an integer column called "day" to the "challenges"
# table.
class AddDayToChallenges < ActiveRecord::Migration[7.1]
  def up
    add_column :challenges, :day, :integer, null: false, default: 1
  end

  def down
    remove_column :challenges, :day
  end
end
