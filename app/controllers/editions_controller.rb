class EditionsController < ApplicationController
  
  
  # GET /editions
  # GET /editions.xml
  def index
    @editions = Edition.find_all_by_published(true, :order => "publish_date DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @editions }
    end
  end

  # GET /editions/1
  # GET /editions/1.xml
  def show
    @edition  = Edition.find(params[:id])
    session[:edition_id]  = @edition.id
    expire_site_pages
    redirect_to home_path
  end
  
end
