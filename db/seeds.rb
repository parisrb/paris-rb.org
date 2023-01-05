User.create_with(password: 'password').find_or_create_by!(email: 'admin@example.org')

Sponsor.create_with(website: "https://scalingo.com").find_or_create_by!(name: 'Scalingo')

Tweet.create_with(
  text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Urna duis convallis convallis tellus id interdum velit.",
  author: "Lorem ipsum",
  cool_projects: "example",
).find_or_create_by!(
  twitter_handle: 'lorem_ipsum'
)

Video.create_with(
  vimeo_url: "https://www.youtube.com/watch?v=Yf09FVj_hG4",
  vimeo_thumbnail: "https://img.youtube.com/vi/Yf09FVj_hG4/maxresdefault.jpg",
  title: "Level up your Capybara acceptance tests using Siteprism",
  description: "Level up your Capybara acceptance tests using Siteprism",
  event_date: "2022-11-08"
).find_or_create_by!(
  slug: "level-up-your-capybara-acceptance-tests-using-siteprism"
)

Video.create_with(
  vimeo_url: "https://www.youtube.com/watch?v=JFPaJnahtH8",
  vimeo_thumbnail: "https://img.youtube.com/vi/JFPaJnahtH8/maxresdefault.jpg",
  title: "Business Logic and data integrity",
  description: "Business Logic and data integrity",
  event_date: "2022-11-08"
).find_or_create_by!(
  slug: "business-logic-and-data-integrity"
)

Video.create_with(
  vimeo_url: "https://www.youtube.com/watch?v=DRrIDPzirzE",
  vimeo_thumbnail: "https://img.youtube.com/vi/DRrIDPzirzE/maxresdefault.jpg",
  title: "Sorbet in practice",
  description: "Sorbet in practice",
  event_date: "2022-11-08"
).find_or_create_by!(
  slug: "sorbet-in-practice"
)

Talk.create_with(
  speaker_name: "Lorem Ipsum",
  speaker_email: "lorem.ipsum@example.org",
  level: "intermediate",
  duration: "long",
  happened_at: "2022-12-06",
  slides: nil,
  video_url: nil,
  speaker_twitter: nil,
  preferred_month_talk: "december",
  time_position: "2022-12-06 19:30:00"
).find_or_create_by!(
  title: "💬 Urna duis convallis convallis tellus",
)
Talk.create_with(
  speaker_name: "Tempor Incididunt",
  speaker_email: "tempor.incididunt@example.org",
  level: "easy",
  duration: "lightning",
  happened_at: "2022-12-06",
  slides: nil,
  video_url: nil,
  speaker_twitter: "@example",
  preferred_month_talk: "december",
  time_position: "2022-12-06 19:00:00"
).find_or_create_by!(
  title: "💬 Sed do eiusmod tempor incididunt",
)
Talk.create_with(
  speaker_name: "Dolore Magna",
  speaker_email: "dolore.magna@example.org",
  level: "intermediate",
  duration: "long",
  happened_at: nil,
  slides: nil,
  video_url: nil,
  speaker_twitter: "",
  preferred_month_talk: "january",
  time_position: nil
).find_or_create_by!(
  title: "Dolore Magna Aliqua",
)
