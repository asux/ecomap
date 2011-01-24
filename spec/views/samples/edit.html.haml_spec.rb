require 'spec_helper'

describe "samples/edit.html.haml" do
  stub_current_user

  before(:each) do
    @sample = assign(:sample, stub_model(Sample,
      :kind => "MyString",
      :object_name => "MyString",
      :lng => 30.5,
      :lat => 50.5,
      :owner => nil,
      :description => "MyText"
    ))
  end

  it "renders the edit sample form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sample_path(@sample), :method => "post" do
      assert_select "input#sample_kind", :name => "sample[kind]"
      assert_select "input#sample_object_name", :name => "sample[object_name]"
      assert_select "input#sample_lng", :name => "sample[lng]"
      assert_select "input#sample_lat", :name => "sample[lat]"
      assert_select "input#sample_owner", :name => "sample[owner]"
      assert_select "textarea#sample_description", :name => "sample[description]"
    end
  end
end
