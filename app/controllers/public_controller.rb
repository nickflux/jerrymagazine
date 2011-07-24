class PublicController < ApplicationController

  def front_cover
    render :layout => 'front_cover'
  end
  
  def index
    @contributors  = @edition.contributors.all
  end
  
  def about_us
    
  end
  
  def submit
    
  end

  def editors_letter
    
  end
  
end
