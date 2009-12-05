# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
    
  include AuthenticatedSystem
  
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  def initialize(*params)
    # Instance variables common to all controllers
    @yn_opts          = [["yes", true], ["no", false]]
    @user_group_opts  = ["writer", "admin"]
    @work_type_opts   = ["poetry", "prose", "review"]
    @link_group_opts  = ['friends', 'bastards']
    
    super(*params)
  end
  
end
