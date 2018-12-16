 #! ruby -EUTF-8
 # -*- mode:ruby; coding:utf-8 -*-
require 'bundler'
Bundler.require

require './app'

Cloudinary.config do |config|
  config.cloud_name = ENV['CLOUD_NAME']
  config.api_key = ENV['CLOUDINARY_API_KEY']
  config.api_secret = ENV['CLOUDINARY_API_SECRET']
end

run Sinatra::Application


