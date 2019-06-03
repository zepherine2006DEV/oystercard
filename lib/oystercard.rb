class Oystercard
  
  MAXBALANCE = 90
  attr_reader :balance
  
  def initialize
    @balance = 0
  end

  def top_up(value)
    raise "Reached limit £#{MAXBALANCE}" if @balance + value >= MAXBALANCE
    @balance = @balance + value
  end
end