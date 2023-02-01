require 'net/http'

module Meetup
  class MembersCount
    def self.total
      new.total
    end

    def initialize
      @key = ENV['MEETUP_KEY']
    end

    def members_count
      REDIS.get('meetup_members')
    end

    def get_meetup_members
      doc = Nokogiri::HTML(open('https://www.meetup.com/parisrb/'))
      text = doc.css('a.groupHomeHeaderInfo-memberLink span').first.text
      count = text.split(' ').first.gsub(',', '').to_i
      REDIS.set('meetup_members', count)
      REDIS.expire('meetup_members', 24.hours)
      count
    rescue
      3285
    end

    def total
      members_count || get_meetup_members
    end
  end
end
