class Sample < ActiveRecord::Base
  KINDS = %w(water soil)
  KIND_INSTANCES = KINDS.map {|kind| SampleKind.new(kind)}
  belongs_to :owner, :class_name => "User"

  validates :kind, :presence => true, :inclusion => {:in => KINDS}
  validates :lng, :presence => true
  validates :lat, :presence => true
  validates :owner, :presence => true

  def to_s
    self.class.human_attribute_name(:to_s, :id => id)
  end

  def kind_instance
    SampleKind.new(kind)
  end

  def pos
    "#{lng} #{lat}"
  end
end
