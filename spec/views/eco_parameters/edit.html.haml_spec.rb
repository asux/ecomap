require 'spec_helper'

describe "eco_parameters/edit.html.haml" do
  stub_current_user

  before(:each) do
    @eco_parameter = assign(:eco_parameter, stub_model(EcoParameter,
      :name => "MyString",
      :description => "MyText",
      :unit => "MyString",
      :kind => "water"
    ))
  end

  it "renders the edit eco_parameter form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => eco_parameter_path(@eco_parameter), :method => "post" do
      assert_select "input#eco_parameter_name", :name => "eco_parameter[name]"
      assert_select "textarea#eco_parameter_description", :name => "eco_parameter[description]"
      assert_select "input#eco_parameter_unit", :name => "eco_parameter[unit]"
      assert_select "input#eco_parameter_kind_water", :name => "eco_parameter[kind]"
      assert_select "input#eco_parameter_kind_soil", :name => "eco_parameter[kind]"
    end
  end
end
