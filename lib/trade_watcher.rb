require "trade_watcher/version"
require "market_beat"

module TradeWatcher
  def self.last_trade(symbol)
    MarketBeat.last_trade_real_time symbol
  end

  def self.is_stock_at_or_above_value(symbol, value)
    last_trade(symbol).to_f >= value
  end

  def self.check_stock_every_x_seconds_for_value(symbol, seconds, value)
    t1 = Thread.new{(self.checker(symbol, seconds, value))} 
  end

  private
      def self.checker(symbol, seconds, value)
        stop_time = Time.now + 3 # an hour from Time.now
        until self.is_stock_at_or_above_value(symbol, value) || Time.now >= stop_time
          pp "#{Time.now} #{symbol} has not met your target of #{value}."
          sleep(seconds)
        end
        target_value_reached(symbol, value)
      end

      def target_value_reached(symbol, value)
        pp "#{symbol} has met or surpassed your target of  #{value}"
      end
end