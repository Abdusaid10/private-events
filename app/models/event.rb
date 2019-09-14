# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: :user_id
  has_many :attendances
  has_many :attendees, through: :attendances, source: 'user'
  has_many :invitations
  scope :upcomming, -> { where('date > ?', DateTime.now) }
  scope :past, -> { where('date < ?', DateTime.now) }
  validates :title, presence: true, length: { maximum: 100 }
  VALID_URL = %r{\A(http|https)://[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(/.*)?\z}ix.freeze
  validates :url, presence: true, format: { with: VALID_URL }
  validates :date, presence: true
end
