module Custom
  class TaskGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('templates', __dir__)

    def copy_task_file
      timestamp = Time.current.strftime('%Y%m%d%H%M%S')

      create_file "lib/tasks/#{timestamp}_#{file_name}.rake", <<~TASK
        desc '#{file_name.humanize}'
        task '#{timestamp}_#{file_name}': :environment do
          # TODO
        end
      TASK
    end
  end
end
