class EcoParameter < ActiveRecord::Base
  include Ecomap::HasSampleKinds

  has_many :samples, :through => :eco_properties
  has_many :eco_properties, :dependent => :destroy

  validates :name, :presence => true, :uniqueness => {:scope => :kind}
  validates :unit, :presence => true

  scope :eco_parameters_by_kind, lambda {|kind| where(:kind => kind)}
  
  def to_s
    "#{kind_instance.human_name}: #{name} (#{unit})"
  end
end
