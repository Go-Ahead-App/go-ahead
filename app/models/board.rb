# frozen_string_literal: true

# == Schema Information
#
# Table name: boards
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :string
#  user_id     :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# A Board belongs to a User.
class Board < ApplicationRecord
  belongs_to :user

  has_many :notes, dependent: :destroy
end
