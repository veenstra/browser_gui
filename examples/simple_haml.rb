#!/usr/bin/env ruby

require "sinatra"
require "browser_gui"
require "haml"

HAML =<<EOF
%h1 Hello from Haml
%form{ :action => "/action", :method => "post" }
  Name:
  %input{ :type => "text", :name => "text", :size => 30 }
  %br/
  %input{ :type => "submit" }
%ul
  - (1..3).each do |i|
  - href = "/link/" + i.to_s
    %li
      %a{ :href => href }
        = (i == 1) ? "Click me!" : "No, click me!"
      %br/
EOF

get "/" do
  haml HAML
end

post "/action" do
  params.inspect
end

get "/link/:id" do
  "You clicked link #{params[:id]}"
end
