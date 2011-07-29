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
    respond_to do |format|
      format.html { render :layout => 'work' }
      format.xml  { render :xml => @work }
    end
  end

end
