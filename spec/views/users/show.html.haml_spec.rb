require 'spec_helper'

describe "users/show.html.haml" do
  stub_current_user
  stub_id_for_url

  before(:each) do
    @user = assign(:user, stub_model(User,
      :email => "Email",
      :password => "Password",
      :password_confirmation => "Password Confirmation",
      :remember_me => false,
      :full_name => "Full Name",
      :info => "MyText",
      :role => "admin"
    ))
  end

  it "renders attributes in <p>" do
    render
#    # Run the generator again with the --webrat flag if you want to use webrat matchers
#    rendered.should match(/Email/)
#    # Run the generator again with the --webrat flag if you want to use webrat matchers
#    rendered.should match(/Password/)
#    # Run the generator again with the --webrat flag if you want to use webrat matchers
#    rendered.should match(/Password Confirmation/)
#    # Run the generator again with the --webrat flag if you want to use webrat matchers
#    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Full Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/#{Role.new('admin').human_name}/)
  end
end
