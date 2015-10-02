ActiveRecord::Base.establish_connection({ 
  adapter: "sqlite3", 
  database: ":memory:"
})
load(File.join(File.dirname(__FILE__), "schema.db"))

class Bot < ActiveRecord::Base
  validate_captcha
end

class Robot < ActiveRecord::Base
  validate_captcha :message => "You are a BOT. Go away."
end
