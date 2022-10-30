# frozen_string_literal: true

# Invite is a class that inherits from ApplicationRecord and has a scope called active.
class Invite < ApplicationRecord
  scope :active, -> { where('expire_at > ?', Time.now) }
end
