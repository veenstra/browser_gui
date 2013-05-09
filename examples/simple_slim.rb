#!/usr/bin/env ruby

require "sinatra"
require "browser_gui"
require "slim"

SLIM =<<EOF
h1 Hello from Slim
form action="/action" method="post"
  | Name:
  input type="text" name="text" size=30
  br
  input type="submit"
ul
  - (1..3).each do |i|
    li
      - href = "/link/" + i.to_s
      a href=href
        = (i == 1) ? "Click me!" : "No, click me!"
EOF

get "/" do
  slim SLIM
end

post "/action" do
  params.inspect
end

get "/link/:id" do
  "You clicked link #{params[:id]}"
end
