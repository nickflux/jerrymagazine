class ApplicationController < ActionController::Base
  
  include AuthenticatedSystem
  
  helper :all # include all helpers, all the time
  protect_from_forgery
    
  filter_parameter_logging :password
  
  before_filter :get_edition

  def initialize(*params)
    # Instance variables common to all controllers
    @yn_opts          = [["yes", true], ["no", false]]
    @user_group_opts  = ["writer", "admin"]
    @work_type_opts   = ["poetry", "prose", "review"]
    @link_group_opts  = ['friends & bastards']
    
    super(*params)
  end
  
  def get_edition
    if session[:edition_id]
      @edition  = Edition.find(session[:edition_id])
    else
      @edition  = Edition.where(["published = ?", true]).order('publish_date DESC').first
    end
  end
  
end
