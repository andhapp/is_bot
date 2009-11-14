module IsBot
  module CaptchaInReverse
    def self.included(base)
      base.extend ClassMethods
      base.class_eval do
        class_inheritable_accessor :captcha_in_reverse
      end  
    end
    
    module ClassMethods
      def validate_captcha(options = {})
        configuration = { :message => 'can not create this because you are a bot.', :on => :save }
        configuration.merge!(options)
        validates_each :captcha_in_reverse, configuration do |record, attr, value|
          record.errors.add attr, configuration[:message] if not value.blank?
        end
      end
    end
  end
end