class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :check_permissions, :only => [:new, :create, :cancel, :edit]
  skip_before_filter :require_no_authentication
       
  def check_permissions
    authorize! :create, resource || User.new
  end
end
