# frozen_string_literal: true

# A Board belongs to a User.
class Board < ApplicationRecord
  belongs_to :user

  has_many :notes, dependent: :destroy
end
