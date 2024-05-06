class LineupsController < ApplicationController
  layout "slides"

  def show
    @talks = Talk.lineup
    @sponsors = Sponsor.current
  end
end
