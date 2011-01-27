require 'spec_helper'

describe "samples/index.html.haml" do
  stub_current_user

  before(:each) do
    assign(:samples, @test = [
      stub_model(Sample,
        :kind => "water",
        :object_name => "Object Name",
        :lng => 30.5,
        :lat => 50.5,
        :owner => nil,
        :description => "MyText"
      ),
      stub_model(Sample,
        :kind => "water",
        :object_name => "Object Name",
        :lng => 30.5,
        :lat => 50.5,
        :owner => nil,
        :description => "MyText"
      )
    ].paginate)
  end

  it "renders a list of samples" do
    render
    @test.each do |sample|
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "tr>td", :text => sample.to_s, :count => 1
    end
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Object Name".to_s, :count => 2
  end
end
