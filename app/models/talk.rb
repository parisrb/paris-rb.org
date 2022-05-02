# == Schema Information
#
# Table name: talks
#
#  id                   :integer          not null, primary key
#  title                :string
#  speaker_name         :string
#  speaker_email        :string
#  level                :string
#  duration             :string
#  created_at           :datetime
#  updated_at           :datetime
#  happened_at          :date
#  slides               :string
#  video_url            :string
#  speaker_twitter      :string
#  preferred_month_talk :string
#  time_position        :datetime
#
# Indexes
#
#  index_talks_on_happened_at  (happened_at)
#

class Talk < ApplicationRecord
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
    allow_blank: true

  validates :speaker_name,
    presence: true

  validates :title,
    presence: true

  after_create_commit :send_slack_notification

  def self.months_iterator(range)
    range.map { |m| Date::MONTHNAMES[((m - 1) % 12) + 1].downcase }.inject({}) { |hash, month|
      path_to_months = 'activerecord.attributes.talk.proposed_months'
      hash[month] = I18n.translate("#{path_to_months}.#{month}")
      hash
    }
  end

  def self.propose_upcoming_months
    today = Date.today
    this_month = today.month
    this_month += 1 if today > today.first_tuesday_of_the_month
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

  private

  def send_slack_notification
    conn = Faraday.new(headers: {'Content-Type' => 'application/json'}) do |conn|
      conn.options.timeout = 5
    end
    conn.post(ENV['SLACK_WEBHOOK_URL'], {text: "Nouveau talk: #{title} par #{speaker_name}" }.to_json)
  rescue => e
    Rails.logger.error "Couldn't send slack notification because of error: #{e.class} #{e.message}"
  end
end
