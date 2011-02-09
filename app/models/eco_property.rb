class EcoProperty < ActiveRecord::Base
  belongs_to :sample
  belongs_to :eco_parameter

  validates :value, :presence => true
  validates :eco_parameter, :uniqueness => {:scope => :sample}
end
