require 'spec_helper'

describe "maps/home.html.haml" do
  it "should have p tag" do
    render

    assert_select("p.text")
  end
end
