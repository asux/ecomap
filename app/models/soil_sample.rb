class SoilSample < Sample
  has_many :soil_eco_parameters, :through => :eco_properties, :source => :eco_parameter
end
