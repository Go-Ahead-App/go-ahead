# == Schema Information
#
# Table name: challenges
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  program_id  :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Challenge < ApplicationRecord
  belongs_to :program

  has_many :actions, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
end
