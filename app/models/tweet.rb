# == Schema Information
#
# Table name: tweets
#
#  id             :integer          not null, primary key
#  text           :string
#  author         :string
#  twitter_handle :string
#  cool_projects  :string
#  created_at     :datetime
#  updated_at     :datetime
#

class Tweet < ActiveRecord::Base
end
