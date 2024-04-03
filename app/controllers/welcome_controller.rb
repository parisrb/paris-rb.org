class WelcomeController < ApplicationController
  expose(:sponsors) { Sponsor.with_attached_logo.latest(4) }
  expose(:tweets) { Tweet.all }
end
