# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

require 'sprockets'

map '/assets' do
  environment = Sprockets::Environment.new
  #assets/javascript以下のファイルを/assetsから呼び出せる
  environment.append_path 'assets/javascript'
  #assets/stylesheets以下のファイルを/assetsから呼び出せる
  environment.append_path 'assets/stylesheets'
  run environment
end


run Rails.application
