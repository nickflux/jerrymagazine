require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Link do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :link_url => "value for link_url",
      :description => "value for description"
    }
  end

  it "should create a new instance given valid attributes" do
    Link.create!(@valid_attributes)
  end
end
