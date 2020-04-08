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
#  happened_on          :date
#  slides               :string(255)
#  video_url            :string(255)
#  speaker_twitter      :string(255)
#  preferred_month_talk :string(255)
#  time_position        :datetime
#  pitch                :text
#
# Indexes
#
#  index_talks_on_happened_on  (happened_on)
#

class Talk < ActiveRecord::Base
  extend Enumerize

  enumerize :level,
    in: %i[easy intermediate expert],
    default: :easy

  enumerize :duration,
    in: %i[lightning long],
    default: :lightning

  scope :happened, -> { where('happened_on < ?', Date.today) }

  scope :lineup, lambda {
    where(happened_on: Date.today..5.weeks.from_now)
      .order(:duration, created_at: :desc)
  }

  scope :proposed, lambda {
    where('happened_on IS NULL OR happened_on > ?', 2.weeks.from_now)
      .order(:duration, created_at: :desc)
  }

  def self.happened_by_meetup
    happened
      .order(happened_on: :desc)
      .group_by(&:happened_on)
  end

  def happened?
    happened_on && happened_on < Date.today
  end
end
