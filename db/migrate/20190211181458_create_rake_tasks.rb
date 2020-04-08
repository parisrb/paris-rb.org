class CreateRakeTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :rake_tasks do |t|
      t.string :version
    end

    add_index :rake_tasks, :version, unique: true
  end
end
