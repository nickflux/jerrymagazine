class LinksController < ApplicationController
  # GET /links
  # GET /links.xml
  def index
    @links = {}
    @link_group_opts.each do |lo|
      links = Link.find_all_by_group(lo)
      @links[lo]  = links
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @links }
    end
  end

end
