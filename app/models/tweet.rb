# == Schema Information
#
# Table name: tweets
#
#  id             :bigint           not null, primary key
#  author         :string
#  cool_projects  :string
#  text           :string
#  twitter_handle :string
#  created_at     :datetime
#  updated_at     :datetime
#

class Tweet < ApplicationRecord
end
