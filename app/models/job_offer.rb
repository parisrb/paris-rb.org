require 'active_resource'
class JobOffer < ActiveResource::Base
  self.site = "https://jobs.rubyparis.org/fr"
end