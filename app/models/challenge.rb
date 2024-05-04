class Challenge < ApplicationRecord
  has_many :challenge_users, dependent: :delete_all
  has_many :users, through: :challenge_users
  has_many :teams

  belongs_to :tournament, optional: true

  enum challenge_type: [:solo, :team]

  scope :standalone, -> { where(tournament_id: nil) }

  scope :upcoming, -> { where('ends_at >= ?', DateTime.current) }
  scope :active, -> { where('starts_at <= ? AND ends_at >= ?', DateTime.current, DateTime.current) }
  scope :ended, -> { where('ends_at < ?', DateTime.current) }

  def active?
    ends_at >= DateTime.current
  end

  def ended?
    ends_at < DateTime.current
  end

  def started?
    starts_at <= DateTime.current
  end

  def standalone?
    tournament_id.nil?
  end

  def tournament?
    !standalone?
  end
end
