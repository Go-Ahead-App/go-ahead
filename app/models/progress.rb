class Progress < ApplicationRecord
  belongs_to :user
  belongs_to :enrolled_program
  belongs_to :event
end
