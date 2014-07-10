class LineupController < ApplicationController
  layout 'reveal'

  expose(:sponsors) { Sponsor.visible }
  expose(:talks) { Talk.lineup }
end
