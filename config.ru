require 'bundler'
Bundler.require

use ActiveRecord::ConnectionAdapters::ConnectionManagement


require './app'
run Sinatra::Application

