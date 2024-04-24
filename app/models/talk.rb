# == Schema Information
#
# Table name: talks
#
#  id                   :bigint           not null, primary key
#  duration             :string
#  happened_at          :date
#  level                :string
#  preferred_month_talk :string
#  priority             :string
#  slides               :string
#  speaker_email        :string
#  speaker_name         :string
#  speaker_twitter      :string
#  time_position        :datetime
#  title                :string
#  video_url            :string
#  created_at           :datetime
#  updated_at           :datetime
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

  validates :speaker_name,
    presence: true

  validates :title,
    presence: true

  def self.months_iterator(range)
    range.map { |m| Date::MONTHNAMES[((m - 1) % 12) + 1].downcase }.inject({}) { |hash, month|
      path_to_months = "activerecord.attributes.talk.proposed_months"
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

  def self.next_meetup_date
    Date.today.first_tuesday_of_the_month < Date.today ? Date.today.next_month.first_tuesday_of_the_month : Date.today.first_tuesday_of_the_month
  end

  ALL_MONTHS = months_iterator(1..12)

  enumerize :priority,
    in: [ :low, :normal, :high ], default: :normal

  enumerize :preferred_month_talk,
    in: ALL_MONTHS.keys.map(&:to_sym)

  validates :preferred_month_talk,
    inclusion: { in: ALL_MONTHS.keys }

  scope :happened,
    -> {
      where("happened_at < ?", Date.today)
        .order(happened_at: :desc, duration: :asc, created_at: :desc)
    }

  scope :lineup,
    -> {
      where("happened_at BETWEEN ? AND ?", Date.today, 2.weeks.from_now)
        .order(duration: :asc, created_at: :desc)
    }

  scope :proposed,
    -> {
      where("happened_at IS NULL OR happened_at > ?", 2.weeks.from_now)
        .order(duration: :asc, created_at: :desc)
    }

  def happened?
    happened_at && happened_at < Date.today
  end

  def emoji
    duration.long? ? "💬" : "⚡"
  end

  def title_with_emoji
    "#{emoji} #{title}"
  end

  def send_slack_notification!
    return if ENV["SLACK_WEBHOOK_URL"].blank?

    conn = Faraday.new(headers: { "Content-Type" => "application/json" }) do |conn|
      conn.options.timeout = 5
    end
    conn.post(ENV["SLACK_WEBHOOK_URL"], { text: <<~MKDWN }.to_json)
      *Nouveau talk* : _#{title}_ par #{speaker_name}

      - #{duration_text}
      - #{level_text}
      - #{preferred_month_talk_text}
    MKDWN
  rescue => e
    Rails.logger.error "Couldn't send slack notification because of error: #{e.class} #{e.message}"
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
