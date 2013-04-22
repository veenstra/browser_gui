require "browser_gui/version"

unless defined? settings
  warn "Cannot find Sinatra settings. Did you require \"sinatra\"?"
  exit 1
end

module BrowserGui
  def self.open_browser(url)
    if RbConfig::CONFIG['host_os'] =~ /mswin|mingw|cygwin/ then
      system("start #{url}")
    elsif RbConfig::CONFIG['host_os'] =~ /darwin/ then
      system("open #{url}")
    elsif RbConfig::CONFIG['host_os'] =~ /linux/ then
      system("xdg-open #{url}")
    end
  end
end

# Sinatra uses an "at_exit" block to start the server, so we have to use
# an "at_exit" block to open the browser.
at_exit { BrowserGui.open_browser("http://localhost:#{settings.port}/") }
