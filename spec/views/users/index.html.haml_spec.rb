require 'spec_helper'

describe "users/index.html.haml" do
  stub_current_user
  stub_id_for_url

  before(:each) do
    assign(:users, @test = [
      stub_model(User,
        :email => "Email",
        :password => "Password",
        :password_confirmation => "Password Confirmation",
        :remember_me => false,
        :full_name => "Full Name",
        :info => "MyText",
        :role => "admin"
      ),
      stub_model(User,
        :email => "Email",
        :password => "Password",
        :password_confirmation => "Password Confirmation",
        :remember_me => false,
        :full_name => "Full Name",
        :info => "MyText",
        :role => "admin"
      )
    ].paginate)
  end

  it "renders a list of users" do
    render
#    # Run the generator again with the --webrat flag if you want to use webrat matchers
#    assert_select "tr>td", :text => "Email".to_s, :count => 2
#    # Run the generator again with the --webrat flag if you want to use webrat matchers
#    assert_select "tr>td", :text => "Password".to_s, :count => 2
#    # Run the generator again with the --webrat flag if you want to use webrat matchers
#    assert_select "tr>td", :text => "Password Confirmation".to_s, :count => 2
#    # Run the generator again with the --webrat flag if you want to use webrat matchers
#    assert_select "tr>td", :text => false.to_s, :count => 2
#    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Full Name".to_s, :count => 2
#    # Run the generator again with the --webrat flag if you want to use webrat matchers
#    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => Role.new("admin").human_name, :count => 2
  end
end
