require 'spec_helper'

describe "samples/show.html.haml" do
  stub_current_user

  before(:each) do
    @sample = assign(:sample, stub_model(Sample,
      :kind => "Kind",
      :object_name => "Object Name",
      :lng => 1.5,
      :lat => 1.5,
      :owner => nil,
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Kind/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Object Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
