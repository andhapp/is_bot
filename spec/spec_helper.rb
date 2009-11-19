require File.join(File.dirname(__FILE__), "..", "lib", "is_bot")

require 'activerecord'
require 'action_view'
require 'yaml'
require 'spec'
 
def connect(environment)
  conf = YAML::load(File.open(File.dirname(__FILE__) + '/database.yml'))
  ActiveRecord::Base.establish_connection(conf[environment])
end
 
connect('test')
load(File.join(File.dirname(__FILE__), "schema.db"))

module ViewHelper; class ViewField < ActionView::Base; end end

Spec::Runner.configure do |config|
  config.include(ViewHelper)
end