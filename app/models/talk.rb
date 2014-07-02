# == Schema Information
#
# Table name: talks
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  speaker_name  :string(255)
#  speaker_email :string(255)
#  level         :string(255)
#  duration      :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  happened_at   :date
#  slides        :string(255)
#  video_url     :string(255)
#
# Indexes
#
#  index_talks_on_happened_at  (happened_at)
#

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
