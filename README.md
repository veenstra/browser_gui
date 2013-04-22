# BrowserGui

Create simple GUI apps in Ruby, using the web browser as the GUI.

Use this gem with Sinatra to automatically open a web page that is controlled by
your Ruby script.  This allows you to package up a simple Sinatra server as a
command-line script and share that script with others. When someone runs that
script, it opens up a new tab in a web browser and they can immediately start
interacting with it.

Works on Mac, Linux, and Windows.

## Installation

Install using:

    $ [sudo] gem install browser_gui

## Example Usage

### A simple HTML form

```
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
```

### A simple Markdown example

```
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
```

## Using command-line options

```
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
```

If you want to support command-line options in your script, you need to process
the options before `require "sinatra"`. The example above uses the
[Trollop](http://trollop.rubyforge.org/) gem to parse the options. This example
supports a `--no-gui` option to disable the default behavior of opening a web
page, and it requires a `--text` string argument (or `-t`). If the example code
above is in the file `gui_optional.rb`, you could run it like this:

```
./gui_optional.rb -t "Hello, world."   # Displays "Hello, world." in a web page
```
or
```
./gui_optional.rb -t "Hello, world." --no-gui  # Displays "Hello, world" to the console.
```

You can still pass arguments to Sinatra (such as setting the port number), like this:

```
./gui_optional.rb -t "Hello, world." -- -p 5678
```

The double dash `--` stops the option processing in the script and passes the
remaining options to Sinatra.  The `-t` option is parsed by the script and the
`-p` option is parsed by Sinatra.
