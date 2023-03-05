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
#
# A Note belongs to a Board.
class Note < ApplicationRecord
  belongs_to :board
end
