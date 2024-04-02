# == Schema Information
#
# Table name: sponsors
#
#  id         :integer          not null, primary key
#  name       :string
#  website    :string
#  logo       :string
#  from       :datetime
#  until      :datetime
#  created_at :datetime
#  updated_at :datetime
#

class Sponsor < ApplicationRecord
  scope :current, ->{ where('until >= ? OR until IS NULL', Time.current) }
  scope :latest,  -> (count) { order(until: :desc).limit(count) }
end
