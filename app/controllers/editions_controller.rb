class EditionsController < ApplicationController
  # GET /editions
  # GET /editions.xml
  def index
    @editions = Edition.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @editions }
    end
  end

  # GET /editions/1
  # GET /editions/1.xml
  def show
    @edition  = Edition.find(params[:id], :order => 'publish_date DESC')
    @poets    = @edition.contributors.all(:conditions => ["work_type = ?", 'poetry'])
    @prosers  = @edition.contributors.all(:conditions => ["work_type = ?", 'prose'])
    @reviews  = @edition.works.all(:conditions => "work_type = 'review'")

    respond_to do |format|
      format.html { render :template => 'public/index'}
      format.xml  { render :xml => @edition }
    end
  end
  
end
