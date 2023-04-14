# == Schema Information
#
# Table name: events
#
#  id                  :bigint           not null, primary key
#  name                :string
#  enrolled_program_id :bigint           not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class Event < ApplicationRecord
  belongs_to :enrolled_program
end
