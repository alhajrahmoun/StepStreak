class User < ApplicationRecord
  has_secure_password

  has_many :activities, dependent: :destroy

  has_many :challenge_users, dependent: :destroy
  has_many :challenges, through: :challenge_users
  has_many :notifications, dependent: :destroy

  scope :with_notification_token, -> { where.not(notification_token: nil) }

  validates :email, presence: true, uniqueness: true

  enum device_type: { ios: 0, android: 1 }

  normalizes :email, with: ->(email) { email.strip.downcase }
end
