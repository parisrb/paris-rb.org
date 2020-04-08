# == Schema Information
#
# Table name: rake_tasks
#
#  id      :bigint(8)        not null, primary key
#  version :string
#
# Indexes
#
#  index_rake_tasks_on_version  (version) UNIQUE
#

class RakeTask < ApplicationRecord
end
