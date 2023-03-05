# frozen_string_literal: true

# == Schema Information
#
# Table name: invites
#
#  id         :bigint           not null, primary key
#  code       :string
#  expire_at  :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Invite is a class that inherits from ApplicationRecord and has a scope called active.
class Invite < ApplicationRecord
  scope :active, -> { where('expire_at > ?', Time.now) }
end
