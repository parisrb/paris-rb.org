class WelcomeController < ApplicationController
  expose(:sponsors) { Sponsor.latest(4) }
  expose(:tweets) { Tweet.all }
end
