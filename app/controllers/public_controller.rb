class PublicController < ApplicationController

  def front_cover
    render :layout => 'front_cover'
  end
  
  def index
    @poets    = @edition.contributors.all(:conditions => ["work_type = ?", 'poetry'])
    @prosers  = @edition.contributors.all(:conditions => ["work_type = ?", 'prose'])
    @reviews  = @edition.works.all(:conditions => "work_type = 'review'")
  end
  
  def about_us
    
  end
  
  def submit
    
  end

  def editors_letter
    
  end
  
end
