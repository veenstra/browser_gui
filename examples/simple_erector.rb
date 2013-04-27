#! /usr/bin/env ruby

require "sinatra"
require "browser_gui"
require "erector"

class Hello < Erector::Widget
  def content
    html {
      head { title "Erector example" }
      body {
        h1 "Hello from Erector."
        form(:action => "/action", :method => "post") {
          text "Name:"
          input :type => "text", :name => "text", :size => 30
          br
          input :type => "submit"
        }
        ul {
          (1..3).each do |index|
            click_text = (index == 1) ? "Click me!" : "No, click me!"
            li { a(:href => "/link/#{index}") { text click_text } }
          end
        }
      }
    }
  end
end

get "/" do
  Hello.new().to_html
end

post "/action" do
  params.inspect
end

get "/link/:id" do
  "You clicked link #{params[:id]}"
end
