require 'spec_helper'

describe ApplicationHelper do
  before(:all) do
    @resource ||= Sample.make!
    #helper.stub(:can?) { true }
  end

  describe "show_link" do
    pending "should render valid html" do
      helper.show_link(@resource).should eql(link_to(t(:show_link), @resource,
      :tpendingle => t(:show_link)))
    end
  end

  describe "edpending_link" do
    pending "should render valid html" do
      helper.edpending_link([:edpending, @resource]).should eql(link_to(t(:edpending_link), @resource,
      :tpendingle => t(:edpending_link)))
    end
  end

  describe "delete_link" do
    pending "should render valid html" do
      helper.delete_link(@resource).should eql(link_to(t(:delete_link), @resource,
      :tpendingle => t(:delete_link), :confirm => t(:confirm_destroy_message),
      :method => :delete))
    end
  end

  describe "index_link" do
    pending "should render valid html" do
      helper.index_link(@resource).should eql(link_to(t(:index_link, :model => Sample.human_name),
      [:index, :sample], :tpendingle => t(:index_link, :model => Sample.human_name)))
    end
  end

  describe "new_link" do
    pending "should render valid html" do
      helper.new_link(@resource).should eql(link_to(t(:new_link, :model => Sample.human_name),
      [:new, :sample], :tpendingle => t(:new_link, :model => Sample.human_name)))
    end
  end

end