require 'spec_helper'

#TODO: Fix error

describe EcoProperty do
  it "should be valid" do
    eco_property = EcoProperty.make
    eco_property.should be_valid
  end

  pending "should be invalid when eco_parameter duplicates" do
    sample = Sample.make
    eco_parameter = EcoParameter.make
    eco_property = EcoProperty.make(:sample => sample, :eco_parameter => eco_parameter)
    eco_property.should be_valid
    eco_property_dup = EcoProperty.make(:sample => sample, :eco_parameter => eco_parameter)
    eco_property_dup.should be_invalid
  end

  pending "should check kind equivalence of kind for sample and eco_parameter" do
    sample = Sample.make!(:kind => 'water')
    eco_parameter = EcoParameter.make(:kind => 'soil')
    eco_property = EcoProperty.make(:sample => sample, :eco_parameter => eco_parameter)
    eco_property.should be_invalid
  end
end
