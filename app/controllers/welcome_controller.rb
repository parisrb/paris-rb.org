require 'meetup/members_count'

class WelcomeController < ApplicationController
  expose(:members_count) { Meetup::MembersCount.total }
  expose(:sponsors) { Sponsor.visible }
  expose(:job_offers) { JobOffer.all }
  expose(:tweets) { Tweet.all }
end
