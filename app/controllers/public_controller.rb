class PublicController < ApplicationController

  caches_page :front_cover, :submit, :editors_letter

  def front_cover
    if session[:edition_id]
      session[:edition_id]  = nil
      expire_site_pages
    end
    # reload edition
    get_edition
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
