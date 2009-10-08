require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/works/show.html.erb" do
  include WorksHelper
  before(:each) do
    assigns[:work] = @work = stub_model(Work,
      :type => "value for type",
      :title => "value for title",
      :abstract => "value for abstract",
      :work_content => "value for work_content",
      :edition_id => 1,
      :user_id => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ type/)
    response.should have_text(/value\ for\ title/)
    response.should have_text(/value\ for\ abstract/)
    response.should have_text(/value\ for\ work_content/)
    response.should have_text(/1/)
    response.should have_text(/1/)
  end
end
