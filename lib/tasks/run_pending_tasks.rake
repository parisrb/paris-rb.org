desc 'Run all pending tasks'
task run_pending_tasks: :environment do
  puts '-----> Running pending tasks…'

  already_run = RakeTask.pluck(:version)
  tasks = Rake.application.tasks.sort_by(&:name)

  tasks.each do |task|
    task_name = task.name.to_s
    timestamp = task_name[/\A(\d{14})_/, 1]

    next unless timestamp
    next if already_run.include?(timestamp)

    puts "-----> Task: #{task_name}"
    Rake::Task[task_name].invoke
    RakeTask.create(version: timestamp)
  end

  puts 'No more task to run.'
end
