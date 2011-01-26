module ViewMacros
  def stub_current_user
    before(:each) do
      controller.stub(:current_user) { @current_user ||= User.make(:role => 'admin') }
      @ability ||= Ability.new(@current_user)
    end
  end

  def stub_id_for_url
    before(:each) do
      controller.stub(:default_url_options) { {:id => "1"} }
    end
  end
end
