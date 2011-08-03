class WorksAdminController < AdminController
  # GET /admin/works
  # GET /admin/works.xml
  def index
    @works = Work.order('editions.edition_no DESC, users.lastname, works.title').all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @works }
    end
  end

  # GET /admin/works/1
  # GET /admin/works/1.xml
  def show
    @work = Work.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @work }
    end
  end

  # GET /admin/works/new
  # GET /admin/works/new.xml
  def new
    @work = Work.new
    @work.work_pages.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @work }
    end
  end

  # GET /admin/works/1/edit
  def edit
    @work = Work.find(params[:id])
  end

  # POST /admin/works
  # POST /admin/works.xml
  def create
    @work = Work.new(params[:work])

    respond_to do |format|
      if @work.save
        flash[:notice] = 'Work was successfully created.'
        format.html { redirect_to :action  => 'show', :id => @work }
        format.xml  { render :xml => @work, :status => :created, :location => @work }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @work.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/works/1
  # PUT /admin/works/1.xml
  def update
    @work = Work.find(params[:id])

    respond_to do |format|
      if @work.update_attributes(params[:work])
        flash[:notice] = 'Work was successfully updated.'
        format.html { redirect_to :action  => 'show', :id => @work }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @work.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/works/1
  # DELETE /admin/works/1.xml
  def destroy
    @work = Work.find(params[:id])
    @work.destroy

    respond_to do |format|
      format.html { redirect_to :action  => 'index' }
      format.xml  { head :ok }
    end
  end
end
