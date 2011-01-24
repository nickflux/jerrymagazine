require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/editions/show.html.erb" do
  include EditionsHelper
  before(:each) do
    assigns[:edition] = @edition = stub_model(Edition,
      :title => "value for title",
      :edition_no => 1,
      :description => "value for description"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ title/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ description/)
  end
end
