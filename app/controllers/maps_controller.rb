class MapsController < ApplicationController
  skip_authorization_check :only => [:home]

  def home
  end

  def index
    authorize! :view_map, :all
    @ymaps_api_key = Ecomap::Application.yaml_config.ymaps_api_key
    Rails.logger.debug "YMAPS #{@ymaps_api_key}"
    @ymapsml_root = Ecomap::Application.yaml_config.ymapsml_root + "points.xml"
  end
end
