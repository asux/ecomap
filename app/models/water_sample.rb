class WaterSample < Sample
  has_many :water_eco_parameters, :through => :eco_properties, :source => :eco_parameter
end
