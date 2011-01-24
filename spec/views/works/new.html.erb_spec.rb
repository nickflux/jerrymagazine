require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/works/new.html.erb" do
  include WorksHelper

  before(:each) do
    assigns[:work] = stub_model(Work,
      :new_record? => true,
      :type => "value for type",
      :title => "value for title",
      :abstract => "value for abstract",
      :work_content => "value for work_content",
      :edition_id => 1,
      :user_id => 1
    )
  end

  it "renders new work form" do
    render

    response.should have_tag("form[action=?][method=post]", works_path) do
      with_tag("input#work_type[name=?]", "work[type]")
      with_tag("input#work_title[name=?]", "work[title]")
      with_tag("textarea#work_abstract[name=?]", "work[abstract]")
      with_tag("textarea#work_work_content[name=?]", "work[work_content]")
      with_tag("input#work_edition_id[name=?]", "work[edition_id]")
      with_tag("input#work_user_id[name=?]", "work[user_id]")
    end
  end
end
