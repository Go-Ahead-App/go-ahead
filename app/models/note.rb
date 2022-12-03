# frozen_string_literal: true

# A Note belongs to a Board.
class Note < ApplicationRecord
  belongs_to :board
end
