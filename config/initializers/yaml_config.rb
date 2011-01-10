require 'yaml_configuration' unless defined? YAMLConfiguration

module Ecomap
  class Application
    def yaml_config
      ::YAMLConfiguration.reload
      ::YAMLConfiguration
    end
  end
end
