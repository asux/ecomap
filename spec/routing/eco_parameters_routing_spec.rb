require "spec_helper"

describe EcoParametersController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/eco_parameters" }.should route_to(:controller => "eco_parameters", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/eco_parameters/new" }.should route_to(:controller => "eco_parameters", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/eco_parameters/1" }.should route_to(:controller => "eco_parameters", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/eco_parameters/1/edit" }.should route_to(:controller => "eco_parameters", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/eco_parameters" }.should route_to(:controller => "eco_parameters", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/eco_parameters/1" }.should route_to(:controller => "eco_parameters", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/eco_parameters/1" }.should route_to(:controller => "eco_parameters", :action => "destroy", :id => "1")
    end

  end
end
