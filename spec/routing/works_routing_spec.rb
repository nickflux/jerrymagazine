require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe WorksController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "works", :action => "index").should == "/works"
    end

    it "maps #new" do
      route_for(:controller => "works", :action => "new").should == "/works/new"
    end

    it "maps #show" do
      route_for(:controller => "works", :action => "show", :id => "1").should == "/works/1"
    end

    it "maps #edit" do
      route_for(:controller => "works", :action => "edit", :id => "1").should == "/works/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "works", :action => "create").should == {:path => "/works", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "works", :action => "update", :id => "1").should == {:path =>"/works/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "works", :action => "destroy", :id => "1").should == {:path =>"/works/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/works").should == {:controller => "works", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/works/new").should == {:controller => "works", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/works").should == {:controller => "works", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/works/1").should == {:controller => "works", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/works/1/edit").should == {:controller => "works", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/works/1").should == {:controller => "works", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/works/1").should == {:controller => "works", :action => "destroy", :id => "1"}
    end
  end
end
