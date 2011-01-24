require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EditionsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "editions", :action => "index").should == "/editions"
    end

    it "maps #new" do
      route_for(:controller => "editions", :action => "new").should == "/editions/new"
    end

    it "maps #show" do
      route_for(:controller => "editions", :action => "show", :id => "1").should == "/editions/1"
    end

    it "maps #edit" do
      route_for(:controller => "editions", :action => "edit", :id => "1").should == "/editions/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "editions", :action => "create").should == {:path => "/editions", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "editions", :action => "update", :id => "1").should == {:path =>"/editions/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "editions", :action => "destroy", :id => "1").should == {:path =>"/editions/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/editions").should == {:controller => "editions", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/editions/new").should == {:controller => "editions", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/editions").should == {:controller => "editions", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/editions/1").should == {:controller => "editions", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/editions/1/edit").should == {:controller => "editions", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/editions/1").should == {:controller => "editions", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/editions/1").should == {:controller => "editions", :action => "destroy", :id => "1"}
    end
  end
end
