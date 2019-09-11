# frozen_string_literal: true

class User < ApplicationRecord
  has_many :events, class_name: 'Event', foreign_key: 'user_id'
  has_many :attendances
  has_many :events_as_attendee, through: :attendances,  source: "event"
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
end
