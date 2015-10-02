require File.expand_path("../../lib/is_bot", __FILE__)
require File.expand_path("../setup", __FILE__)

module ViewHelper
  class ViewField < ActionView::Base
  end 
end

RSpec.configure do |config|
  config.include(ViewHelper)
end
