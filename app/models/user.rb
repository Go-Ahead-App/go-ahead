# frozen_string_literal: true

# After a user is created, check if they have an invite code and if so, confirm them.
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :check_invite_code

  private

  def check_invite_code
    return unless invite_code.present?

    invite = Invite.active.find_by(code: invite_code)

    return unless invite

    self.confirmed_at = Time.now
    save
  end
end
