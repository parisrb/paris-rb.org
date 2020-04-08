class ApplicationForm < Reform::Form
  include Reform::Form::ActiveRecord
  include Reform::Form::ActiveModel::ModelReflections
end
