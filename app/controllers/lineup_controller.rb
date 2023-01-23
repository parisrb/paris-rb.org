class LineupController < ApplicationController
  layout 'reveal'

  expose(:sponsors) { Sponsor.current }
  expose(:talks) { Talk.lineup }
end
