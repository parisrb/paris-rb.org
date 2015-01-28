require 'active_resource'
class JobOffer < ActiveResource::Base
  self.site = "http://jobs.rubyparis.org/fr"
end