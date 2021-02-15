class ApplicationController < ActionController::Base
  helper_method :current_guest

  def current_guest
    if session[:guest_id].present?
      @current_guest ||= Guest.find(session[:guest_id])
    end
  end
end
