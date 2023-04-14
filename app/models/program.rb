# == Schema Information
#
# Table name: programs
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  difficulty  :integer
#  length      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Program < ApplicationRecord
  has_many :challenges, dependent: :destroy
end
