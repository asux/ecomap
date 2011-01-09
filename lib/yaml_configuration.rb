require 'yaml'
require 'erb'
require 'ostruct'

class YAMLConfiguration
  # YAMLConfiguration is class for getting settings from ERB enabled +config/application.yml+ file.
  # Example:
  #
  #   YAMLConfiguration.from_email #=> "admin@example.com"
  @@settings = nil
  class MissingConfigOptionError < StandardError; end

  # Load configuration from file
  def self.load!
    @@settings = OpenStruct.new(YAML.load(ERB.new(File.read(Rails.root.join('config', 'application.yml'))).result))
    @@settings = OpenStruct.new(@@settings.send(RAILS_ENV))
  end

  def self.method_missing(sym)
    self.load! if @@settings.nil?
    raise MissingConfigOptionError, "#{sym.to_s} is not in the application configuration file" unless @@settings.respond_to?(sym)
    @@settings.send(sym)
  end
end
