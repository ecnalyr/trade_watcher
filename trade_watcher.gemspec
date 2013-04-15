# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'trade_watcher/version'

Gem::Specification.new do |gem|
  gem.name          = "trade_watcher"
  gem.version       = TradeWatcher::VERSION
  gem.authors       = ["Jason Rylance"]
  gem.email         = ["ecnalyr@gmail.com"]
  gem.description   = %q{TradeWatcher is a gem that notifies you when / if a stock's value has met or exceeded your target value.}
  gem.summary       = %q{TradeKing.check_stock_every_x_seconds_for_value(:AAPL, 10, 800.54) Checks AAPL every 10 seconds to see if it reaches 800.54}
  gem.homepage      = "http://github.com/ecnalyr/trade_watcher"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "market_beat"

  gem.add_development_dependency "rspec"
end
