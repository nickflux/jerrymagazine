require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Edition do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :edition_no => 1,
      :publish_date => Date.today,
      :description => "value for description"
    }
  end

  it "should create a new instance given valid attributes" do
    Edition.create!(@valid_attributes)
  end
end
