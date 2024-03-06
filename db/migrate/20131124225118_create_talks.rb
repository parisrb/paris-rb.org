class CreateTalks < ActiveRecord::Migration[7.0]
  def change
    create_table :talks do |t|
      t.string  :title
      t.string  :speaker_name
      t.string  :speaker_email
      t.string  :level
      t.string  :duration
      t.timestamps
    end
  end
end
