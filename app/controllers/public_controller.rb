class PublicController < ApplicationController

  def front_cover
    render :layout => 'front_cover'
  end
  
  def index
    @edition  = Edition.first(:order => 'publish_date DESC')
    @poets    = @edition.contributors.all(:conditions => ["work_type = ?", 'poetry'])
    @prosers  = @edition.contributors.all(:conditions => ["work_type = ?", 'prose'])
    @reviews  = @edition.works.all(:conditions => "work_type = 'review'")
  end
  
  def about_us
    
  end
  
  def submit
    
  end
  
end