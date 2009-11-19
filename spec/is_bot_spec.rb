%w(spec_helper ../init models).each{|path| require File.join(File.dirname(__FILE__), path) }

# ********************* SET-UP **************************
# ---------- Models
# There are two models that are used for describing IsBot
# 1. Bot
# 2. Robot
# Both the models can be found in the models.rb file
# 
# ---------- Schema
# The schema is described in scehma.rb
#
# ---------- Database configuration
# The specs use sqlite3 adapter and the configuration is described in database.yml

describe IsBot do
  context "ClassMethods" do
    context "Set up" do
      
      it "should be in the list of included modules" do
        Bot.included_modules.should include(IsBot::CaptchaInReverse)
      end

      it "should add a virtual accessor 'captcha_in_reverse' to the class" do
        bot = Bot.new
        bot.should.respond_to?(:captcha_in_reverse)
        bot.should.respond_to?(:captcha_in_reverse=)  
      end

      it "should add a class method 'validate_captcha'" do
        Bot.should.respond_to?(:validate_captcha)
      end
    end

    context "Validation" do

      before(:each) do
        @bot = Bot.new
      end

      # because a bot would fill in the hidden field really
      it "should add to the errors if 'captcha_in_reverse' is not blank?" do
        lambda {
          @bot.captcha_in_reverse = "I am a Bot!"
          @bot.valid?
        }.should change(@bot.errors, :size).by(1)
        @bot.errors.on "captcha_in_reverse" == "can not create this because you are a bot."
      end

      # because human is not expected to fill this field
      it "should not add to errors when 'captcha_in_reverse' is blank? " do
        lambda {
          @bot.captcha_in_reverse = nil
          @bot.valid?
        }.should_not change(@bot.errors, :size).by(1)
      end    

      context "Custom validation" do
        it "should accept a custom error message" do
          robot = Robot.new(:captcha_in_reverse => "I am a Bot!")    
          robot.valid?
          robot.errors.on "captcha_in_reverse" == "You are a BOT. Go away."    
        end
      end

    end
  end
  
  context "Helper" do
    context "set up" do
      it "should include the defined custom helper module" do
        ViewHelper::ViewField.included_modules.should include(IsBot::ViewHelper)
      end
    end
    
    context "input tag" do
      it "should create one for adding captcha" do
        ViewHelper::ViewField.new.should.respond_to?(:captcha_reverse_field)
      end
      
      it "should be hidden" do
        captcha_field = ViewHelper::ViewField.new.captcha_reverse_field(:bot)
        captcha_field.should include("style=\";display: none;\"")
      end
      
      it "should include the custom defined styles" do
        captcha_field = ViewHelper::ViewField.new.captcha_reverse_field(:bot, {:style => "color:red"})
        captcha_field.should include("style=\"color:red;display: none;\"")        
      end
    end
  end
  
end