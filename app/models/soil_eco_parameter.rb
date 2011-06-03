class SoilEcoParameter < EcoParameter
  has_many :soil_samples, :through => :eco_properties, :source => :sample
end
