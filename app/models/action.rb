# == Schema Information
#
# Table name: actions
#
#  id           :bigint           not null, primary key
#  name         :string
#  description  :text
#  challenge_id :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Action < ApplicationRecord
  belongs_to :challenge

  has_many :excercises, dependent: :destroy
end
