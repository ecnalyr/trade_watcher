# TradeWatcher

TradeWatcher is a gem that notifies you when / if a stock's value has met or exceeded your target value.

In this version (1.0.0):

* TradeWatcher will only watch a stock for up to 1 hour from the time you initiate the command.

* TradeWatcher will only be able to watch for a stock to surpass a value, not drop below a value (you can monitor long states, not short).

* TradeWatcher will print updates to your console for the duration of an existing notification task.

TradeWatcher depends on the Market_Beat gem written by Michaeldv https://github.com/michaeldv/market_beat

## Installation

Add this line to your application's Gemfile:

    gem 'trade_watcher'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install trade_watcher

## Usage

  The following command will set up an alert that:
  
  * Checks the market value of AAPL (Apple Inc. on Nasdaq) 
  * every 10 seconds 
  * to see if the value has surpassed $800.00.
  
        $ TradeWatcher.check_stock_every_x_seconds_for_value(:AAPL, 10, 800.54)
    
While the stock's value is below your target value, a string will print to your console every time the stock's value is checked:

    $2013-04-15 10:55:32 -0500 AAPL has not met your target of 800.54.
    
When the stock's value meets or exceeds your target value, a string will print to your console stating it has done so:

    $2013-04-15 12:06:32 -0500 The monitoring of AAPL with a target of 800.54 has expired due to the time limit of 1 hour being rached

  


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
