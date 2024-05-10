class WelcomeController < ApplicationController
  before_action :set_counters, only: :index

  def index
    @videos = Video.chronologically.limit(3)
    @sponsors = Sponsor.with_attached_logo.latest(4)
    @lineup_talks = Talk.lineup
  end

  private

  def set_counters
    @videos_count = $memory_cache.fetch("videos_count", expires_in: 1.day) { Video.count }
    @sponsors_count = $memory_cache.fetch("sponsors_count", expires_in: 1.day) { Sponsor.count }
  end
end
