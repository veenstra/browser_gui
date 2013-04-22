# -*- encoding: utf-8 -*-
require File.expand_path('../lib/browser_gui/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jack Veenstra"]
  gem.email         = ["veenstra@gmail.com"]
  gem.description   = %q{Use with Sinatra to create command-line scripts that open the browser as a GUI.}
  gem.summary       = %q{Use the browser as a GUI.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "browser_gui"
  gem.require_paths = ["lib"]
  gem.version       = BrowserGui::VERSION
end
