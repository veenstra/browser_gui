#!/usr/bin/env ruby

require "sinatra"
require "browser_gui"

# Change the URL that the browser opens to /hello and add a parameter.
set :browser_url, "/hello?world=1"

get "/hello" do
  "params: #{params.inspect}"
end
