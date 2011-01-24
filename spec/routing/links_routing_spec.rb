require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe LinksController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "links", :action => "index").should == "/links"
    end

    it "maps #new" do
      route_for(:controller => "links", :action => "new").should == "/links/new"
    end

    it "maps #show" do
      route_for(:controller => "links", :action => "show", :id => "1").should == "/links/1"
    end

    it "maps #edit" do
      route_for(:controller => "links", :action => "edit", :id => "1").should == "/links/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "links", :action => "create").should == {:path => "/links", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "links", :action => "update", :id => "1").should == {:path =>"/links/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "links", :action => "destroy", :id => "1").should == {:path =>"/links/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/links").should == {:controller => "links", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/links/new").should == {:controller => "links", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/links").should == {:controller => "links", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/links/1").should == {:controller => "links", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/links/1/edit").should == {:controller => "links", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/links/1").should == {:controller => "links", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/links/1").should == {:controller => "links", :action => "destroy", :id => "1"}
    end
  end
end
