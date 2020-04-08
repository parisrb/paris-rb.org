class HomepageController < ApplicationController
  def show
    @members_count = 8888 #Meetup::MembersCounter.new.call
    @sponsors = Sponsor.visible
    @talk_form = TalkForm.new(Talk.new)
    # @job_offers = JobOffer.all
  end
end
