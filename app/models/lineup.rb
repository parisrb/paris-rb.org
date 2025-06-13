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
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_talks_on_created_at   (created_at)
#  index_talks_on_happened_at  (happened_at)
#
class Lineup < Talk
  default_scope { lineup }
end
