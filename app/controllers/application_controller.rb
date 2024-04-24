class ApplicationController < ActionController::Base
  include Analytics
  protect_from_forgery with: :exception

  before_action do
    # This will need to be removed once we have transitioned to the new design
    # during the transition period we can visit any page and add ?new=true to
    # see the new design (if it exists)

    if params[:new] == "true"
      session[:site_design] = :new
    elsif params[:new] == "false"
      session[:site_design] = nil
    end

    request.variant = session[:site_design]&.to_sym
  end
end
