class SponsorsController < ApplicationController
  def index
    @sponsors = Sponsor.with_attached_logo.randomize
  end
end
