require 'spec_helper'

describe "samples/new.html.haml" do
  stub_current_user

  before(:each) do
    assign(:sample, stub_model(Sample,
      :kind => "water",
      :object_name => "MyString",
      :lng => 30.5,
      :lat => 50.5,
      :owner => nil,
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new sample form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => samples_path, :method => "post" do
      assert_select "input#sample_kind_water", :name => "sample[kind]"
      assert_select "input#sample_kind_soil", :name => "sample[kind]"
      assert_select "input#sample_object_name", :name => "sample[object_name]"
      assert_select "input#sample_lng", :name => "sample[lng]"
      assert_select "input#sample_lat", :name => "sample[lat]"
      assert_select "select#sample_owner_id", :name => "sample[owner_id]"
      assert_select "textarea#sample_description", :name => "sample[description]"
    end
  end
end
