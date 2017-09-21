# == Schema Information
#
# Table name: talks
#
#  id                   :integer          not null, primary key
#  title                :string(255)
#  speaker_name         :string(255)
#  speaker_email        :string(255)
#  level                :string(255)
#  duration             :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  happened_at          :date
#  slides               :string(255)
#  video_url            :string(255)
#  speaker_twitter      :string(255)
#  preferred_month_talk :string(255)
#  time_position        :datetime
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

  validates :speaker_twitter,
    format: { with: /\A@.+\z/ },
    allow_nil: true

  validates :speaker_name,
    presence: true

  validates :title,
    presence: true

  def self.months_iterator(range)
    range.map { |m| Date::MONTHNAMES[m].downcase }.inject({}) { |hash, month|
      path_to_months = 'activerecord.attributes.talk.proposed_months'
      hash[month] = I18n.translate("#{path_to_months}.#{month}")
      hash
    }
  end

  def self.propose_upcoming_months
    this_month = Date.today.month
    months_iterator(this_month..this_month + 3)
  end

  ALL_MONTHS = months_iterator(1..12)

  enumerize :preferred_month_talk,
    in: ALL_MONTHS.keys.map(&:to_sym)

  validates :preferred_month_talk,
    inclusion: { in: ALL_MONTHS.keys }

  scope :happened,
    -> {
      where('happened_at < ?', Date.today)
        .order(happened_at: :desc, duration: :asc, created_at: :desc)
    }

  scope :lineup,
    -> {
      where('happened_at BETWEEN ? AND ?', Date.today, 2.weeks.from_now)
        .order(duration: :asc, created_at: :desc)
    }

  scope :proposed,
    -> {
      where('happened_at IS NULL OR happened_at > ?', 2.weeks.from_now)
        .order(duration: :asc, created_at: :desc)
    }

  def happened?
    happened_at && happened_at < Date.today
  end
end
