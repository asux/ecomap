require 'spec_helper'

describe "eco_parameters/index.html.haml" do
  stub_current_user

  before(:each) do
    assign(:eco_parameters, @test = [
      stub_model(EcoParameter,
        :name => "Name",
        :description => "MyText",
        :unit => "Unit",
        :kind => "water"
      ),
      stub_model(EcoParameter,
        :name => "Name",
        :description => "MyText",
        :unit => "Unit",
        :kind => "water"
      )
    ].paginate)
  end

  it "renders a list of eco_parameters" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Unit".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => SampleKind.new('water').human_name, :count => 2
  end
end
