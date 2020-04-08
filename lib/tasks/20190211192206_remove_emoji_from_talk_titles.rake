desc 'Remove emoji from talk titles'
task '20190211192206_remove_emoji_from_talk_titles': :environment do
  Talk.update_all("title = REPLACE(title, '💬 ', '')")
  Talk.update_all("title = REPLACE(title, '💬', '')")
  Talk.update_all("title = REPLACE(title, '⚡ ', '')")
  Talk.update_all("title = REPLACE(title, '⚡', '')")

  puts 'Removed 💬 and ⚡ from talk names'
end
