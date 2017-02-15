require 'yaml'
class Configuration
def self.[] key
  @@config[key]
end

def self.load name
  @@config = nil
  io = File.open( File.dirname(__FILE__) + "/datafiles/environment_data.yml" )
  YAML::load_documents(io) { |doc| @@config = doc[name] }
  $BASE_CONFIG = @@config
    raise "Could not locate a configuration named \"#{name}\"" unless @@config && $BASE_CONFIG
 end

def self.[]= key, value
  @@config[key] = value
end

end

raise "Please set the TEST_ENV environment variable" unless ENV['TEST_ENV']
Configuration.load(ENV['TEST_ENV'])
