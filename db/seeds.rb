User.create_with(password: 'password').find_or_create_by!(email: 'admin@example.org')

puts "Creating sponsors"

Sponsor.all.delete_all
sponsors = YAML.load(File.read("#{Rails.root}/test/fixtures/sponsors.yml")).values

puts "create 2 current sponsors"
sponsors.first(2).each do |sponsor|
  Sponsor.find_or_create_by!(name: sponsor['name']) do |s|
    s.website = sponsor['website']
    s.logo = sponsor['logo']
    s.from = Time.current
    s.until = Time.current + 2.months
  end
end

puts "create a permanent sponsor"
sponsor = sponsors[2]

Sponsor.find_or_create_by!(name: sponsor['name']) do |s|
  s.website = sponsor['website']
  s.logo = sponsor['logo']
  s.from = nil
  s.until = nil
end

puts "create a past sponsors"

sponsors[3..].each do |sponsor|
  Sponsor.find_or_create_by!(name: sponsor['name']) do |s|
    months = rand(1..12)
    s.website = sponsor['website']
    s.logo = sponsor['logo']
    s.from = Time.current - (months + 1).months
    s.until = Time.current - months.month
  end
end


puts "created #{Sponsor.count} sponsors"

puts "create videos"

Video.all.delete_all

videos = YAML.load(File.read("#{Rails.root}/test/fixtures/videos.yml")).values

videos.each do |video|
  Video.find_or_create_by!(title: video['title']) do |v|
    v.attributes = video.except('id', 'created_at', 'updated_at')
    v.skip_sitemap = true
  end
end

puts "created #{Video.count} videos"

puts "Creating talks"

Talk.all.delete_all
talks = YAML.load(File.read("#{Rails.root}/test/fixtures/talks.yml")).values

talks.each do |talk|
  Talk.find_or_create_by!(title: talk['title']) do |t|
    t.attributes = talk.except('id', 'created_at', 'updated_at')
    t.preferred_month_talk = talk['preferred_month_talk'].presence || Talk::ALL_MONTHS.keys.sample
  end
end

puts "created #{Talk.count} talks"


