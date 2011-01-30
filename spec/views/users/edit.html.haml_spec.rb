require 'spec_helper'

describe "users/edit.html.haml" do
  stub_current_user
  stub_id_for_url

  before(:each) do
    @user = assign(:user, stub_model(User,
      :email => "MyString",
      :password => "MyString",
      :password_confirmation => "MyString",
      :remember_me => false,
      :full_name => "MyString",
      :info => "MyText",
      :role => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => user_path(@user), :method => "post" do
      assert_select "input#user_email", :name => "user[email]"
      #assert_select "input#user_password", :name => "user[password]"
      #assert_select "input#user_password_confirmation", :name => "user[password_confirmation]"
      #assert_select "input#user_remember_me", :name => "user[remember_me]"
      assert_select "input#user_full_name", :name => "user[full_name]"
      assert_select "textarea#user_info", :name => "user[info]"
      #assert_select "input[name=user_role]", :name => "user[role]"
    end
  end
end
