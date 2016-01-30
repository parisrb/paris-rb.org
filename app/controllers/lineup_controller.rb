class LineupController < ApplicationController
  layout 'reveal'

  expose(:sponsors) { Sponsor.visible }
  expose(:talks) { Talk.lineup }
  expose(:next_talks) { Talk.next_talks }
end
