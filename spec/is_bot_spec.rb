require File.join(File.dirname(__FILE__), "spec_helper")
require File.join(File.dirname(__FILE__), "..", "init")
require File.join(File.dirname(__FILE__), "models")

describe IsBot do

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