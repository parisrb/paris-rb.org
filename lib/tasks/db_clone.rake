namespace :db do
  desc "Import the last production backup into local db"
  task import_last_backup: :environment do
    system 'powder stop' if defined?(Powder)
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    system "pg_restore -O -x -d #{Rails.configuration.database_configuration[Rails.env]['database']} tmp/latest.dump"
    Rake::Task['db:migrate'].invoke
    system 'powder start' if defined?(Powder)
  end

  desc "Clone the heroku production db into local db"
  task clone_prod: :environment do
    system 'heroku pg:backups capture --remote heroku'
    system 'curl -o tmp/latest.dump `heroku pg:backups --remote heroku public-url`'
    Rake::Task['db:import_last_backup'].invoke
    # if Rails.env.development?
    #   Rake::Task['data:sanitize_production_data'].invoke
    # end
  end
end
