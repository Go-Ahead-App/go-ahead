# frozen_string_literal: true

# This class inherits from ActiveRecord::Migration and has a change method that creates a table called
# activities with a name, description, and event_id column
class CreateActivities < ActiveRecord::Migration[7.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.text :description
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
