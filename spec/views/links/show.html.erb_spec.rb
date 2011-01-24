require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/links/show.html.erb" do
  include LinksHelper
  before(:each) do
    assigns[:link] = @link = stub_model(Link,
      :title => "value for title",
      :link_url => "value for link_url",
      :description => "value for description"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ title/)
    response.should have_text(/value\ for\ link_url/)
    response.should have_text(/value\ for\ description/)
  end
end
