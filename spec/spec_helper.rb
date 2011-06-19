require 'bundler'
Bundler.require(:default)

require 'active_record'
require 'action_view'

require File.expand_path("../../init", __FILE__)
require File.expand_path("../models", __FILE__)

def connect(environment)
  conf = YAML::load(File.open(File.dirname(__FILE__) + '/database.yml'))
  ActiveRecord::Base.establish_connection(conf[environment])
end

connect('test')
load(File.join(File.dirname(__FILE__), "schema.db"))

module ViewHelper; class ViewField < ActionView::Base; end end

RSpec.configure do |config|
  config.include(ViewHelper)
end
