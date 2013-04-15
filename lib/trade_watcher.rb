require "trade_watcher/version"
require "market_beat"

module TradeWatcher
  def self.last_trade(symbol)
    MarketBeat.last_trade_real_time symbol
  end

  def self.is_stock_at_or_above_value(symbol, value)
    last_trade(symbol).to_f >= value
  end
end
