class LineupController < ApplicationController
  layout 'reveal'

  def show
    @sponsors = Sponsor.visible
    @talks = Talk.lineup
  end
end
