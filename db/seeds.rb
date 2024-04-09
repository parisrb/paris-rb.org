User.create_with(password: 'password').find_or_create_by!(email: 'admin@example.org')

puts "Creating sponsors"

Sponsor.all.destroy_all
sponsors = YAML.load(Rails.root.join("test/fixtures/sponsors.yml").read).values

puts "create 2 current sponsors"
sponsors.first(2).each do |sponsor_attributes|
  sponsor = Sponsor.find_or_create_by!(name: sponsor_attributes['name']) do |s|
    s.website = sponsor_attributes['website']
    s.from = Time.current
    s.until = Time.current + 2.months
  end

  # use Clearbit api to get the logo

  image = URI.open(sponsor.clearbit_logo_url)
  sponsor.logo.attach(io: image, filename: "#{sponsor.name}")
  sponsor.save!
end

puts "create a permanent sponsor"
sponsor_attributes = sponsors[2]

sponsor = Sponsor.find_or_create_by!(name: sponsor_attributes['name']) do |s|
  s.website = sponsor_attributes['website']
  s.from = nil
  s.until = nil
end
# use Clearbit api to get the logo

image = URI.open(sponsor.clearbit_logo_url)
sponsor.logo.attach(io: image, filename: "#{sponsor.name}")
sponsor.save!

puts "create a past sponsors"

sponsors[3..].each do |sponsor_attributes|
  sponsor = Sponsor.find_or_create_by!(name: sponsor_attributes['name']) do |s|
    months = rand(1..12)
    s.website = sponsor_attributes['website']
    s.from = Time.current - (months + 1).months
    s.until = Time.current - months.month
  end

  # use Clearbit api to get the logo

  puts sponsor.clearbit_logo_url
  begin
    image = URI.open(sponsor.clearbit_logo_url)
    sponsor.logo.attach(io: image, filename: "#{sponsor.name}")
    sponsor.save!
  rescue => e
    puts "logo not found for #{sponsor.name}"
  end
end

puts "created #{Sponsor.count} sponsors"

puts "create videos"

Video.all.destroy_all

videos = YAML.load(Rails.root.join("test/fixtures/videos.yml").read, permitted_classes: [ Date ]).values

videos.each do |video|
  Video.find_or_create_by!(title: video['title']) do |v|
    v.attributes = video.except('id', 'created_at', 'updated_at')
    v.skip_sitemap = true
  end
end

puts "created #{Video.count} videos"

puts "Creating talks"

Talk.all.destroy_all
talks = YAML.load(Rails.root.join("test/fixtures/talks.yml").read, permitted_classes: [ Date ]).values

talks.each do |talk|
  Talk.find_or_create_by!(title: talk['title']) do |t|
    t.attributes = talk.except('id', 'created_at', 'updated_at')
    t.preferred_month_talk = talk['preferred_month_talk'].presence || Talk::ALL_MONTHS.keys.sample
  end
end

Talk.last(3).each do |talk|
  talk.update_column(:happened_at, 2.weeks.from_now)
end

puts "created #{Talk.count} talks"
