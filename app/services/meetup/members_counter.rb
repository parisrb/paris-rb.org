require 'net/http'

module Meetup
  class MembersCounter
    KEY = ENV.fetch('MEETUP_KEY')
    URL = "http://api.meetup.com/2/groups?group_urlname=parisrb&format=json&key=#{KEY}"

    def call
      members_count || get_meetup_members
    end

    private def members_count
      $redis.get('meetup_members')
    end

    private def get_meetup_members
      json = ::Net::HTTP.get(URI(URL))
      parisrb = JSON.parse(json).fetch('results').first
      $redis.set('meetup_members', parisrb['members'])
      $redis.expire('meetup_members', 24.hours)
      members_count
    end

  end
end
