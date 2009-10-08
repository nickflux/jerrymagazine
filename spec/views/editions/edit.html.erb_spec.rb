require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/editions/edit.html.erb" do
  include EditionsHelper

  before(:each) do
    assigns[:edition] = @edition = stub_model(Edition,
      :new_record? => false,
      :title => "value for title",
      :edition_no => 1,
      :description => "value for description"
    )
  end

  it "renders the edit edition form" do
    render

    response.should have_tag("form[action=#{edition_path(@edition)}][method=post]") do
      with_tag('input#edition_title[name=?]', "edition[title]")
      with_tag('input#edition_edition_no[name=?]', "edition[edition_no]")
      with_tag('textarea#edition_description[name=?]', "edition[description]")
    end
  end
end
