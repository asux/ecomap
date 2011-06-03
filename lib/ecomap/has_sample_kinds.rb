module Ecomap::HasSampleKinds
  extend ActiveSupport::Concern
  
  KINDS = %w(water soil)
  KIND_INSTANCES = KINDS.map {|kind| SampleKind.new(kind)}

  module ClassMethods
    def kind
      name.gsub(superclass.name, '').underscore
    end
  end

  module InstanceMethods
    def kind
      self.class.kind
    end
    
    def kind=(value)
      self.type = value.to_s.camelize + self.class.name
    end

    def kind_instance
      SampleKind.new(kind)
    end
  end
end