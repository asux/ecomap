class WaterEcoParameter < EcoParameter
  has_many :water_samples, :through => :eco_properties, :source => :sample
end
