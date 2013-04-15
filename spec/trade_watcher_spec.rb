require 'spec_helper'

describe  "TradeWatcher" do
  it "can make market_beat calls" do
    apple_symbol = MarketBeat.symbol :AAPL
    apple_symbol.should == "AAPL"
  end
end