module ControllerMacros
  def login_admin
    before(:each) do
      sign_in User.make(:role => 'admin')
    end
  end
end
