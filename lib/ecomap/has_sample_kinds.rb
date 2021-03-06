module Ecomap
  module HasSampleKinds
    KINDS = %w(water soil)
    KIND_INSTANCES = KINDS.map {|kind| SampleKind.new(kind)}

    def self.included(base)
      base.class_eval do
        validates :kind, :presence => true, :inclusion => {:in => KINDS}
        scope :only_kind, lambda { |kind| where(:kind => kind) }
      end
    end

    def kind_instance
      SampleKind.new(kind)
    end
  end
end