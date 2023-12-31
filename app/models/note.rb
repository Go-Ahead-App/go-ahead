# frozen_string_literal: true

# == Schema Information
#
# Table name: notes
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :string
#  content     :text
#  board_id    :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
class Note < ApplicationRecord
  belongs_to :board

  has_and_belongs_to_many :categories
end
