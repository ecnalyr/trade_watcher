require 'spec_helper'

describe  "TradeWatcher" do
  context "when comparing quotes to targets values" do
    it "can report true if a quote is above a target value" do
      TradeWatcher.stub!(:last_trade).and_return(901)
      TradeWatcher.is_stock_at_or_above_value(:AAPL, 900).should == true
    end

    it "can report false if a quote is below a target value" do
      TradeWatcher.stub!(:last_trade).and_return(901)
      TradeWatcher.is_stock_at_or_above_value(:AAPL, 1000).should == false
    end
  end


end