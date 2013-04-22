#!/usr/bin/env ruby

require "sinatra"
require "browser_gui"

CONTENTS_MD =<<EOF
# An Example Using Markdown and Sinatra
* [Click me](/action/1)
* [No, click me](/action/2)
EOF


get "/" do
  markdown CONTENTS_MD
end

get "/action/:id" do
  "You clicked link #{params[:id]}"
end
