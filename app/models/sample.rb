class Sample < ActiveRecord::Base
  KINDS = %w(water soil)
  KIND_INSTANCES = KINDS.map {|kind| SampleKind.new(kind)}
  belongs_to :owner, :class_name => "User"

  validates :kind, :presence => true, :inclusion => {:in => KINDS}
  validates :lng, :presence => true
  validates :lat, :presence => true
  validates :owner, :presence => true

  acts_as_mappable :default_units => :kms

  before_validation :geocode

  def to_s
    self.class.human_attribute_name(:to_s, :id => id)
  end

  def kind_instance
    SampleKind.new(kind)
  end

  def latlng
    @latlng ||= GeoKit::LatLng.new(lat, lng)
  end

  def geocode
    if self.object_name.to_s.empty? || self.kind == 'auto'
      geo_loc = latlng.reverse_geocode(:using => :yandex)
      if geo_loc.success?
        self.object_name = geo_loc.full_address if self.object_name.to_s.empty?
        self.kind = geo_loc.kind == 'hydro' ? 'water' : 'soil' if self.kind == 'auto'
      else
        self.errors[:kind] = I18n.t('acriverecord.errors.messages.sample.kind_unable_auto', :default => "unable automatic determine sample kind")
      end
    end
  end
end
