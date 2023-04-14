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
#  layout      :integer          default("list")
#
class Board < ApplicationRecord
  # TODO: Implement calendar layout.
  enum layout: { list: 0, grid: 1, kanban: 2 }

  belongs_to :user

  has_many :notes, dependent: :destroy
end
