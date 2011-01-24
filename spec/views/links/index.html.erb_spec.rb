require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/links/index.html.erb" do
  include LinksHelper

  before(:each) do
    assigns[:links] = [
      stub_model(Link,
        :title => "value for title",
        :link_url => "value for link_url",
        :description => "value for description"
      ),
      stub_model(Link,
        :title => "value for title",
        :link_url => "value for link_url",
        :description => "value for description"
      )
    ]
  end

  it "renders a list of links" do
    render
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", "value for link_url".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
  end
end
