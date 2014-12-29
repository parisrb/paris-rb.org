require 'active_resource'
class JobOffer < ActiveResource::Base
  self.site = "http://parisrb.jobboardmaker.com/fr"
end