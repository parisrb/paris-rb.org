class AddSpeakerTwitterToTalk < ActiveRecord::Migration
  def change
    add_column :talks, :speaker_twitter, :string
  end
end
