class RemoveEmojiPrefixFromTalks < ActiveRecord::Migration[7.0]
  def up
    Talk.all.each { _1.update!(title: _1.title.delete_prefix('💬').delete_prefix('⚡'.strip)) }
  end

  def down
    Talk.all.each { _1.update!(title: _1.title_with_emoji) }
  end
end
