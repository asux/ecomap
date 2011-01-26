require 'spec_helper'

describe Sample do
  def geo_loc(stubs = {})
    @geo_loc ||= stub(GeoKit::GeoLoc.new, stubs)
  end

  describe "when geocede is success" do
    it "should set object_name form full_address if it blank" do
      @sample = Sample.make(:object_name => nil)
      @sample.latlng.stub(:reverse_geocode) { geo_loc(:success? => true, :full_address => 'full address') }
      @sample.save
      @sample.object_name.should eql('full address')
    end

    it "should set kind 'water' from geocode kind 'hydro' if kind was 'auto'" do
      @sample = Sample.make(:kind => 'auto')
      @sample.latlng.stub(:reverse_geocode) { geo_loc(:success? => true, :kind => 'hydro') }
      @sample.save
      @sample.kind.should eql('water')
    end

    it "should set kind 'soil' from geocode kind not 'hydro' if kind was 'auto'" do
      @sample = Sample.make(:kind => 'auto')
      @sample.latlng.stub(:reverse_geocode) { geo_loc(:success? => true, :kind => 'house') }
      @sample.save
      @sample.kind.should eql('soil')
    end
  end

  describe "when geocode is fault" do
    it "should leave object_name blank" do
      @sample = Sample.make(:object_name => nil)
      @sample.latlng.stub(:reverse_geocode) { geo_loc(:success? => false) }
      @sample.save
      @sample.object_name.should be_nil
    end

    it "should add error for kind field if it was 'auto'" do
      @sample = Sample.make(:kind => 'auto')
      @sample.latlng.stub(:reverse_geocode) { geo_loc(:success? => false) }
      @sample.save
      @sample.errors[:kind].should_not be_empty
    end
  end
end
