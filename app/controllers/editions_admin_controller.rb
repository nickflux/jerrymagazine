class EditionsAdminController < AdminController
  
  cache_sweeper :edition_sweeper
  
  # GET /admin/editions
  # GET /admin/editions.xml
  def index
    @editions = Edition.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @editions }
    end
  end

  # GET /admin/editions/1
  # GET /admin/editions/1.xml
  def show
    @edition = Edition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @edition }
    end
  end

  # GET /admin/editions/new
  # GET /admin/editions/new.xml
  def new
    @edition = Edition.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @edition }
    end
  end

  # GET /admin/editions/1/edit
  def edit
    @edition = Edition.find(params[:id])
  end

  # POST /editions
  # POST /editions.xml
  def create
    @edition = Edition.new(params[:edition])

    respond_to do |format|
      if @edition.save
        flash[:notice] = 'Edition was successfully created.'
        format.html { redirect_to(@edition) }
        format.xml  { render :xml => @edition, :status => :created, :location => @edition }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @edition.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/editions/1
  # PUT /admin/editions/1.xml
  def update
    @edition = Edition.find(params[:id])

    respond_to do |format|
      if @edition.update_attributes(params[:edition])
        flash[:notice] = 'Edition was successfully updated.'
        format.html { redirect_to(editions_admin_path(:action => 'show', :id => @edition)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @edition.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/editions/1
  # DELETE /admin/editions/1.xml
  def destroy
    @edition = Edition.find(params[:id])
    @edition.destroy

    respond_to do |format|
      format.html { redirect_to(editions_url) }
      format.xml  { head :ok }
    end
  end
end
