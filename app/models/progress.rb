# == Schema Information
#
# Table name: progresses
#
#  id                  :bigint           not null, primary key
#  completed           :boolean
#  user_id             :bigint           not null
#  enrolled_program_id :bigint           not null
#  event_id            :bigint           not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class Progress < ApplicationRecord
  belongs_to :user
  belongs_to :enrolled_program
  belongs_to :event
end
