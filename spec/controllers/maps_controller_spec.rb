require 'spec_helper'

describe MapsController do
  login_admin

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
  end

  # FIXME: false
  describe "GET 'index'" do
    pending "should be successful" do
      get 'index'
      response.should be_success
    end
  end

end
