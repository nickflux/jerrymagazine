require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/works/index.html.erb" do
  include WorksHelper

  before(:each) do
    assigns[:works] = [
      stub_model(Work,
        :type => "value for type",
        :title => "value for title",
        :abstract => "value for abstract",
        :work_content => "value for work_content",
        :edition_id => 1,
        :user_id => 1
      ),
      stub_model(Work,
        :type => "value for type",
        :title => "value for title",
        :abstract => "value for abstract",
        :work_content => "value for work_content",
        :edition_id => 1,
        :user_id => 1
      )
    ]
  end

  it "renders a list of works" do
    render
    response.should have_tag("tr>td", "value for type".to_s, 2)
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", "value for abstract".to_s, 2)
    response.should have_tag("tr>td", "value for work_content".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
