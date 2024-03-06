class AddSpeakerTwitterToTalk < ActiveRecord::Migration[7.0]
  def change
    add_column :talks, :speaker_twitter, :string
  end
end
