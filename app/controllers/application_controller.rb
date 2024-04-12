class ApplicationController < ActionController::Base
  include Analytics
  protect_from_forgery with: :exception
end
