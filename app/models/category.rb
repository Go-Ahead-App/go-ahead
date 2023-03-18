# frozen_string_literal: true

# A Category belongs to a Note.
class Category < ApplicationRecord
  belongs_to :note
end
