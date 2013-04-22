#!/usr/bin/env ruby

require "sinatra"
require "browser_gui"

FORM = '<form action="/action" method="post">
  Name: <input type="text" name="text" size="30"><br><input type="submit">
  </form>'

get "/" do
  FORM
end

post "/action" do
  params.inspect
end
