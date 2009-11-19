require File.join(File.dirname(__FILE__), "lib", "is_bot")

ActiveRecord::Base.send(:include, IsBot::CaptchaInReverse)
ActionView::Base.send(:include, IsBot::ViewHelper)