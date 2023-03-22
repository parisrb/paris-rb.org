class RemoveEmojiPrefixFromTalks < ActiveRecord::Migration[7.0]
  def up
    Talk.all.each do |talk|
      title = talk.title.delete_prefix('💬').delete_prefix('⚡').strip
      talk.update!(title: title)
    end
  end

  def down
    Talk.all.each do |talk|
      talk.update!(title: talk.title_with_emoji)
    end
  end
end
