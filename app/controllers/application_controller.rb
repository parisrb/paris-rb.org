class ApplicationController < ActionController::Base
  include Analytics
  include Internationalisation
  protect_from_forgery with: :exception

  def memory_cache
    $memory_cache
  end
end
