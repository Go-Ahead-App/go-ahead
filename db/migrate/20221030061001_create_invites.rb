# frozen_string_literal: true

# CreateInvites is a class that inherits from ActiveRecord::Migration and has a change method.
class CreateInvites < ActiveRecord::Migration[7.1]
  def change
    create_table :invites do |t|
      t.string :code
      t.datetime :expire_at

      t.timestamps
    end
  end
end
