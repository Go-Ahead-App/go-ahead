# frozen_string_literal: true

# We're creating a new table called boards, and it has a title, description, and a user_id
class CreateBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :boards do |t|
      t.string :title
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
