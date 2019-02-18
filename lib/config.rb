require 'singleton'
require 'yaml'

class Config
  include Singleton

  def [](val)
    @config ||= YAML.load_file("#{__dir__}/../config.yml")
    @config[val]
  end
end
