require "browser_gui/version"

unless defined? settings
  warn "Cannot find Sinatra settings. Did you require \"sinatra\"?"
  exit 1
end

module BrowserGui
  def self.open_browser(url)
    command = case RbConfig::CONFIG['host_os']
      when /mswin|mingw|cygwin/ then "start '#{url}'"
      when /darwin/ then "open '#{url}'"
      when /linux/ then "xdg-open '#{url}'"
    end
    # Spawn a process and return without waiting for it. Sleep 1 second to give Sinatra time to start up.
    command = "sleep 1; #{command}"
    pid = spawn(command)
    Process.detach(pid)
  end
end

# Sinatra uses an "at_exit" block to start the server, so we have to use
# an "at_exit" block to open the browser.
at_exit {
  browser_url = settings.respond_to?(:browser_url) ? settings.browser_url : "/"
  browser_host = settings.respond_to?(:browser_host) ? settings.browser_host : "localhost"
  BrowserGui.open_browser("http://#{browser_host}:#{settings.port}#{browser_url}")
}
