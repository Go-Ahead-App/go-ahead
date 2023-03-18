# frozen_string_literal: true

# Add a column named layout to the boards table, and make it an integer.
class AddLayoutToBoards < ActiveRecord::Migration[7.1]
  def up
    add_column :boards, :layout, :integer, default: 0
  end

  def down
    remove_column :boards, :layout
  end
end
