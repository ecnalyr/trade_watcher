require 'spec_helper'

describe  "TradeWatcher", :vcr do
  it "can make market_beat calls" do
    apple_symbol = MarketBeat.symbol :AAPL
    apple_symbol.should == "AAPL"
  end

  it "can get market_beat quotes" do
    TradeWatcher.last_trade(:AAPL).should == "429.80"
  end

  context "when comparing quotes to targets values" do
    it "can report true if a quote is above a target value" do
      TradeWatcher.is_stock_at_or_above_value(:AAPL, 400).should == true
    end

    it "can report false if a quote is below a target value" do
      TradeWatcher.is_stock_at_or_above_value(:AAPL, 800).should == false
    end
  end


end