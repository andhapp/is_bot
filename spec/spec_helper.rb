require File.join(File.dirname(__FILE__), "..", "lib", "is_bot")

require 'activerecord'
require 'yaml'
require 'spec'
 
def connect(environment)
  conf = YAML::load(File.open(File.dirname(__FILE__) + '/database.yml'))
  ActiveRecord::Base.establish_connection(conf[environment])
end
 
connect('test')
load(File.join(File.dirname(__FILE__), "schema.db"))