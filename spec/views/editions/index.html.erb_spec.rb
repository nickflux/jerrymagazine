require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/editions/index.html.erb" do
  include EditionsHelper

  before(:each) do
    assigns[:editions] = [
      stub_model(Edition,
        :title => "value for title",
        :edition_no => 1,
        :description => "value for description"
      ),
      stub_model(Edition,
        :title => "value for title",
        :edition_no => 1,
        :description => "value for description"
      )
    ]
  end

  it "renders a list of editions" do
    render
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
  end
end
