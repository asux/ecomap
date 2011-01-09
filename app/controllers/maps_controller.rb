class MapsController < ApplicationController
  skip_authorization_check :only => [:home]

  def home
  end

  def index
    authorize! :view_map, :all
  end
end
