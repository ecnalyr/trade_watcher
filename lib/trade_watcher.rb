require "trade_watcher/version"
require "market_beat"

module TradeWatcher


  def self.check_stock_every_x_seconds_for_value(symbol, seconds, value)
    t1 = Thread.new{(self.checker(symbol, seconds, value))} 
  end

  private
      def self.checker(symbol, seconds, value)
        stop_time = get_stop_time
        pp stop_time
        until is_stock_at_or_above_value(symbol, value) || Time.now >= stop_time
          pp "#{Time.now} #{symbol} has not yet met your target of #{value}."
          sleep(seconds)
        end
        if Time.now >= stop_time
          out_of_time(symbol, value)
        else
          reached_target(symbol, value)
        end
      end

      def self.get_stop_time
        Time.now + 3600 # an hour from Time.now
      end

      def self.reached_target(symbol, value)
        pp "#{Time.now} #{symbol} has met or exceeded your target of #{value}."
      end

      def self.out_of_time(symbol, value)
        pp "#{Time.now} The monitoring of #{symbol} with a target of #{value} has expired due to the time limit of 1 hour being rached."
      end

      def self.last_trade(symbol)
        MarketBeat.last_trade_real_time symbol
      end

      def self.is_stock_at_or_above_value(symbol, value)
        last_trade(symbol).to_f >= value
      end
end