# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: :user_id
  has_many :attendances
  has_many :attendees, through: :attendances, source: 'user'
  scope :upcomming, -> { where("date > ?", DateTime.now )}
  scope :past, -> { where("date < ?", DateTime.now )}
end
