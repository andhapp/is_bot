module IsBot
  module CaptchaInReverse
    def self.included(base)
      base.class_eval do
        extend ClassMethods
        class_attribute :captcha_in_reverse
      end
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
      style << "display: none;"
      ActionView::Helpers::InstanceTag.new(object, :captcha_in_reverse, self).to_input_field_tag("text", options.merge(:style => style) )
    end
  end

end
