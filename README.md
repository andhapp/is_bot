# is_bot

## About

**is_bot** is a clean rewrite of **less_reverse_captcha**

It is a simple way to make your forms bot-proof. The effectiveness of the solution is open to discussion. I have used it on a low traffic site and it seems to have reduced the bot-attack considerably.


## Usage

It is very simple to use. Just install it in your rails app and perform the following steps. 

In your model class:
    
    class User < ActiveRecord::Base
      validate_captcha
    end
    
In your model's view:
    
    form_for @user do |f|
      captcha_reverse_field :user
    end
    
And that's it.

## Rails 3

Use version 1.0.0

## Rails 4

Use version 2.0.0 and above.

## [Wiki](https://github.com/andhapp/is_bot/wiki)

There are a couple of pages describing inner workings and pecuilar use cases. Will update it as and when I come
across more pecuilar ones.

## Versioning

The project uses semantic versioning.

## Bugs

Please report the issues through [Github's issues](https://github.com/andhapp/is_bot/issues).


## Authors

* Anuj Dutta - [andHapp.com](http://www.andhapp.com/blog)

