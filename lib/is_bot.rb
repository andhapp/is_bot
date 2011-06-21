$: << File.join(File.dirname(__FILE__), "..", "lib")

require "is_bot/is_bot"

ActiveRecord::Base.send(:include, IsBot::CaptchaInReverse)
ActionView::Base.send(:include, IsBot::ViewHelper)