class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :check_current_user

  def check_current_user
    if logged_in?
      unless @mixpanel.nil?
        @mixpanel = @mixpanel + 'mixpanel.people.identify("' + current_user.email + '"); mixpanel.name_tag("' + current_user.email + '"); '
      else
        @mixpanel = 'mixpanel.people.identify("' + current_user.email + '"); mixpanel.name_tag("' + current_user.email + '"); '
      end
      unless session[:mixpanel].nil?
        @mixpanel = @mixpanel + session[:mixpanel]
        session[:mixpanel] = ""
      end
    end
  end

  private
	  def not_authenticated
	    redirect_to login_url, :alert => "First log in to view this page."
	  end

end
