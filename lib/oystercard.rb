class Oystercard
  
  MAXBALANCE = 90
  MINBALANCE = 1
  attr_reader :balance, :in_journey
    alias :in_journey? :in_journey
  
  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(value)
    raise "Reached limit £#{MAXBALANCE}" if @balance + value >= MAXBALANCE
    @balance = @balance + value
  end

  def deduct(value)
    @balance = @balance - value
  end

  def touch_in
    raise "Insufficient balance" if @balance < MINBALANCE
    @in_journey = true
  end

   def touch_out
    @in_journey = false
  end
endgi