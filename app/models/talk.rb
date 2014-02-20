class Talk < ActiveRecord::Base
  extend Enumerize

  enumerize :level,
    in: %i[easy intermediate expert],
    default: :easy

  enumerize :duration,
    in: %i[lightning long],
    default: :lightning

  validates :duration,
    presence: true

  validates :level,
    presence: true

  validates :speaker_email,
    format: { with: /\A[^@]+@[^@]+\z/ },
    presence: true

  validates :speaker_name,
    presence: true

  validates :title,
    presence: true

  scope :happened,
    -> { where.not(happened_at: nil) }

  scope :to_come,
    -> { where(happened_at: nil) }
end
