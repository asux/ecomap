require 'spec_helper'

describe "users/new.html.haml" do
  before(:each) do
    assign(:user, stub_model(User,
      :email => "MyString",
      :password => "MyString",
      :password_confirmation => "MyString",
      :remember_me => false,
      :full_name => "MyString",
      :info => "MyText",
      :role => "MyString"
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path, :method => "post" do
      assert_select "input#user_email", :name => "user[email]"
      assert_select "input#user_password", :name => "user[password]"
      assert_select "input#user_password_confirmation", :name => "user[password_confirmation]"
      assert_select "input#user_remember_me", :name => "user[remember_me]"
      assert_select "input#user_full_name", :name => "user[full_name]"
      assert_select "textarea#user_info", :name => "user[info]"
      assert_select "input#user_role", :name => "user[role]"
    end
  end
end
