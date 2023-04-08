# == Schema Information
#
# Table name: activities
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  event_id    :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Activity < ApplicationRecord
  belongs_to :event
end
