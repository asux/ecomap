require 'spec_helper'

describe "samples/show.html.haml" do
  stub_current_user
  stub_id_for_url

  before(:each) do
    @sample = assign(:sample, stub_model(Sample,
      :kind => "water",
      :object_name => "Object Name",
      :lng => 30.5,
      :lat => 50.5,
      :owner => nil,
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/#{SampleKind.new('water').human_name}/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Object Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/30.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/50.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
