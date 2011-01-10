require "spec_helper"

describe MapsController do
  describe "routing" do

    it "recognizes and generates #home" do
      { :get => "/" }.should route_to(:controller => "maps", :action => "home")
    end

    it "recognizes and generates #index" do
      { :get => "/maps" }.should route_to(:controller => "maps", :action => "index")
    end

  end
end
