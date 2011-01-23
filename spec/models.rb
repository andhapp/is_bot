class Bot < ActiveRecord::Base
  validate_captcha
end

class Robot < ActiveRecord::Base
  validate_captcha :message => "You are a BOT. Go away."
end
