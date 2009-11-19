is_bot
======

About
-----

**is_bot** is a clean rewrite of **less_reverse_captcha**

It is a simple way to make your forms bot-proof. The effectiveness of the solution is open to discussion. I have used it on a low traffic site and it seems to have reduced the bot-attack considerably.


Usage
-----
It is very simple to use. Just install it in your rails app and perform the following steps. 

In your model class:
    
    class User < ActiveRecord::Base
      validate_captcha
    end
    
In your model's view:
    
    form_for @user do |F|
      f.captcha_reverse_field :user
    end
    
And that's it.


Bugs
----

Please report the issues through gitHub's issues.


Authors
-------

* Anuj Dutta - [andHapp.com](http://www.andhapp.com/blog)