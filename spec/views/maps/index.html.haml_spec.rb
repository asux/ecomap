require 'spec_helper'

describe "maps/index.html.haml" do
  stub_current_user

  it "should have div#yandex-map" do
    render

    assert_select("div#yandex-map")
  end
end
