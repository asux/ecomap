module ControllerMacros
  def login_admin
    before(:each) do
      @current_user ||= (User.find_by_role('admin') or User.make!(:role => 'admin'))
      sign_in(@current_user)
    end
  end
end
