require 'meetup/members_count'

class WelcomeController < ApplicationController
  expose(:members_count) { Meetup::MembersCount.total }
  expose(:sponsors) { Sponsor.visible }
  expose(:tweets) { Tweet.all }
end
