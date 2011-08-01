class WorksController < ApplicationController
  # GET /works
  # GET /works.xml
  def index
    @works = Work.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @works }
    end
  end

  # GET /works/1
  # GET /works/1.xml
  def show
    @work     = Work.find(params[:id])
    @edition  = @work.edition
    @page     = params[:page].blank? ? 1 : params[:page].to_i
    
    if !@work.work_pages.none?
      @work_page  = @work.work_pages[@page-1]
    end
    
    respond_to do |format|
      format.html { render :layout => 'work' }
      format.xml  { render :xml => @work }
    end
  end

end
