module ViewMacros
  def stub_current_user
    before(:each) do
      controller.stub(:current_user) { @current_user ||= User.make(:role => 'admin') }
      @ability ||= Ability.new(@current_user)
    end
  end
end
