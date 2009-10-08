require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Work do
  before(:each) do
    @valid_attributes = {
      :type => "value for type",
      :title => "value for title",
      :abstract => "value for abstract",
      :work_content => "value for work_content",
      :edition_id => 1,
      :user_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Work.create!(@valid_attributes)
  end
end
