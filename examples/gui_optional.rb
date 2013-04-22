#!/usr/bin/env ruby

# Handle options before 'require "sinatra"'

require "trollop"

opts = Trollop::options do
  banner "Usage: #$0 [options]"
  opt :gui, "Use gui", :default => true
  opt :text, "text", :type => :string, :required => true
end

if opts[:gui] == false
  puts opts[:text]
  exit 0
end

require "sinatra"
require "browser_gui"

get "/" do
  opts[:text]
end
