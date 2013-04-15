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

  it "checks stock value multiple times while stock is not at or above the target value" do
    TradeWatcher.stub!(:last_trade).and_return(200)
    TradeWatcher.should_receive(:is_stock_at_or_above_value).at_least(2).times
    TradeWatcher.check_stock_every_x_seconds_for_value(:AAPL, 1, 400)
    sleep(2)
  end

  it "triggers target_value_reahed when the stock has met or surpassed the target value" do
    TradeWatcher.stub!(:last_trade).and_return(200)
    TradeWatcher.should_receive(:target_value_reached).exactly(1).times
    TradeWatcher.check_stock_every_x_seconds_for_value(:AAPL, 1, 100)
    sleep(1)
  end

end