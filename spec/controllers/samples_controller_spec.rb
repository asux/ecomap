require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe SamplesController do
  login_admin

  def mock_sample(stubs={})
    @mock_sample ||= mock_model(Sample, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all samples as @samples" do
      Sample.stub(:accessible_by) { [mock_sample].paginate }
      get :index
      assigns(:samples).should eq([mock_sample].paginate)
    end
  end

  describe "GET show" do
    it "assigns the requested sample as @sample" do
      Sample.stub(:find) { mock_sample }
      get :show, :id => "37"
      assigns(:sample).should be(mock_sample)
    end

    it "assigns location" do
      mock_sample(:latlng => :latlng)
      Sample.stub(:find) { mock_sample }
      get :show, :id => "37"
      assigns(:location).should eq(:latlng)
    end
  end

  describe "GET new" do
    it "assigns a new sample as @sample" do
      Sample.stub(:new) { mock_sample }
      get :new
      assigns(:sample).should be(mock_sample)
    end
  end

  describe "GET edit" do
    it "assigns the requested sample as @sample" do
      Sample.stub(:find) { mock_sample }
      get :edit, :id => "37"
      assigns(:sample).should be(mock_sample)
    end

    it "assigns location" do
      mock_sample(:latlng => :latlng)
      Sample.stub(:find) { mock_sample }
      get :show, :id => "37"
      assigns(:location).should eq(:latlng)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created sample as @sample" do
        Sample.stub(:new) { mock_sample(:save => true) }
        post :create, :sample => {'these' => 'params'}
        assigns(:sample).should be(mock_sample)
      end

      it "redirects to the created sample" do
        Sample.stub(:new) { mock_sample(:save => true) }
        post :create, :sample => {}
        response.should redirect_to(sample_url(mock_sample))
      end

      it "sets current_user as owner" do
        Sample.stub(:new) { mock_sample(:save => true) }
        mock_sample.should_receive(:owner=).with(controller.current_user)
        post :create, :sample => {}
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved sample as @sample" do
        Sample.stub(:new) { mock_sample(:save => false) }
        post :create, :sample => {'these' => 'params'}
        assigns(:sample).should be(mock_sample)
      end

      it "re-renders the 'new' template" do
        Sample.stub(:new) { mock_sample(:save => false) }
        post :create, :sample => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested sample" do
        Sample.stub(:find) { mock_sample }
        mock_sample.should_receive(:update_attributes)
        put :update, :id => "37", :sample => {'these' => 'params'}
      end

      it "assigns the requested sample as @sample" do
        Sample.stub(:find) { mock_sample(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:sample).should be(mock_sample)
      end

      it "redirects to the sample" do
        Sample.stub(:find) { mock_sample(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(sample_url(mock_sample))
      end
    end

    describe "with invalid params" do
      it "assigns the sample as @sample" do
        Sample.stub(:find) { mock_sample(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:sample).should be(mock_sample)
      end

      it "re-renders the 'edit' template" do
        Sample.stub(:find) { mock_sample(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested sample" do
      Sample.stub(:find) { mock_sample }
      mock_sample.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the samples list" do
      Sample.stub(:find) { mock_sample }
      delete :destroy, :id => "1"
      response.should redirect_to(samples_url)
    end
  end

end
