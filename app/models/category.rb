# frozen_string_literal: true

# A Category belongs to a Note.
class Category < ApplicationRecord
  has_and_belongs_to_many :notes
end
