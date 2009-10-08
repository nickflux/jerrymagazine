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
    @edition = Edition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @edition }
    end
  end
  
end
