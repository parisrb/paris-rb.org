class WelcomeController < ApplicationController
  def index
    @videos = Video.order("created_at DESC").limit(3)
    @sponsors = Sponsor.with_attached_logo.latest(4)
    @lineup_talks = Talk.lineup
  end
end
