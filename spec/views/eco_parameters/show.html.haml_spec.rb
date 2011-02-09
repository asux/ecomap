require 'spec_helper'

describe "eco_parameters/show.html.haml" do
  stub_current_user

  before(:each) do
    @eco_parameter = assign(:eco_parameter, stub_model(EcoParameter,
      :name => "Name",
      :description => "MyText",
      :unit => "Unit",
      :kind => "water"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Unit/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/#{SampleKind.new('water').human_name}/)
  end
end
