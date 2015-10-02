require "is_bot/version"
require 'active_record'
require 'action_view'
require 'active_support'

module IsBot
  module CaptchaInReverse
    extend ::ActiveSupport::Concern

    included do 
      class_attribute :captcha_in_reverse
    end

    module ClassMethods
      def validate_captcha(options = {})
        validates_each :captcha_in_reverse do |record, attr, value|
          record.errors[attr] << (options[:message] || "You are a bot!") unless value.blank?
        end
      end
    end
  end

  module ViewHelper
    def captcha_reverse_field(object, options={})
      style = (options.delete(:style) || '') << ";"
      style << "visibility: hidden;"
      ActionView::Helpers::Tags::TextField.new(
        object, :captcha_in_reverse, self, options.merge(:style => style)
      ).render
    end
  end
end

ActiveRecord::Base.send(:include, IsBot::CaptchaInReverse)
ActionView::Base.send(:include, IsBot::ViewHelper)
