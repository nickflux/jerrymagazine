require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/works/edit.html.erb" do
  include WorksHelper

  before(:each) do
    assigns[:work] = @work = stub_model(Work,
      :new_record? => false,
      :type => "value for type",
      :title => "value for title",
      :abstract => "value for abstract",
      :work_content => "value for work_content",
      :edition_id => 1,
      :user_id => 1
    )
  end

  it "renders the edit work form" do
    render

    response.should have_tag("form[action=#{work_path(@work)}][method=post]") do
      with_tag('input#work_type[name=?]', "work[type]")
      with_tag('input#work_title[name=?]', "work[title]")
      with_tag('textarea#work_abstract[name=?]', "work[abstract]")
      with_tag('textarea#work_work_content[name=?]', "work[work_content]")
      with_tag('input#work_edition_id[name=?]', "work[edition_id]")
      with_tag('input#work_user_id[name=?]', "work[user_id]")
    end
  end
end
