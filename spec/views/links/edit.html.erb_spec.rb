require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/links/edit.html.erb" do
  include LinksHelper

  before(:each) do
    assigns[:link] = @link = stub_model(Link,
      :new_record? => false,
      :title => "value for title",
      :link_url => "value for link_url",
      :description => "value for description"
    )
  end

  it "renders the edit link form" do
    render

    response.should have_tag("form[action=#{link_path(@link)}][method=post]") do
      with_tag('input#link_title[name=?]', "link[title]")
      with_tag('input#link_link_url[name=?]', "link[link_url]")
      with_tag('textarea#link_description[name=?]', "link[description]")
    end
  end
end
