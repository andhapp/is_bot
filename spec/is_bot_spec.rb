require 'spec_helper'

describe IsBot do
  context "ClassMethods" do
    context "Set up" do

      it "should be in the list of included modules" do
        expect(Bot.included_modules).to include(IsBot::CaptchaInReverse)
      end

      it "should add a virtual accessor 'captcha_in_reverse' to the class" do
        bot = Bot.new
        expect(bot).to respond_to(:captcha_in_reverse)
        expect(bot).to respond_to(:captcha_in_reverse=)
      end

      it "should add a class method 'validate_captcha'" do
        expect(Bot).to respond_to(:validate_captcha)
      end
    end

    context "Validation" do

      before(:each) do
        @bot = Bot.new
      end

      # because a bot would fill in the hidden field
      it "should add to the errors if 'captcha_in_reverse' is not blank?" do
        expect {
          @bot.captcha_in_reverse = "I am a Bot!"
          @bot.valid?
        }.to change(@bot.errors, :size).by(1)
        @bot.errors[:captcha_in_reverse] == "You are a bot!"
      end

      # because human is not expected to fill this field
      it "should not add to errors when 'captcha_in_reverse' is blank? " do
        expect {
          @bot.captcha_in_reverse = nil
          @bot.valid?
        }.not_to change(@bot.errors, :size)
      end

      context "Custom validation" do
        it "should accept a custom error message" do
          robot = Robot.new(:captcha_in_reverse => "I am a Bot!")
          robot.valid?
          robot.errors[:captcha_in_reverse] == "You are a BOT. Go away"
        end
      end

    end
  end

  context "Helper" do
    context "set up" do
      it "should include the defined custom helper module" do
        expect(ViewHelper::ViewField.included_modules).to include(IsBot::ViewHelper)
      end
    end

    context "input tag" do
      it "should create one for adding captcha" do
        expect(ViewHelper::ViewField.new).to respond_to(:captcha_reverse_field)
      end

      it "should be hidden" do
        captcha_field = ViewHelper::ViewField.new.captcha_reverse_field(:bot)
        expect(captcha_field).to include("style=\";visibility: hidden;\"")
      end

      it "should include the custom defined styles" do
        captcha_field = ViewHelper::ViewField.new.captcha_reverse_field(:bot, {:style => "color:red"})
        expect(captcha_field).to include("style=\"color:red;visibility: hidden;\"")
      end
    end
  end

end

