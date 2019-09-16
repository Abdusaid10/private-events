# frozen_string_literal: true

class User < ApplicationRecord
  has_many :events
  has_many :attendances
  has_many :events_as_attendee, through: :attendances, source: 'event'
  has_many :invitations, class_name: 'Invitation', foreign_key: 'invitation_creator'
  has_many :invitations_received, class_name: 'Invitation', foreign_key: 'invited_user'
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
end
