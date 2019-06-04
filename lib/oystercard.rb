class Oystercard

  MAXIMUM_BALANCE = 90
  
  MAXBALANCE = 90
  MINBALANCE = 1
  attr_reader :balance, :in_journey
    alias :in_journey? :in_journey
  
  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    fail 'Maximum balance of #{maximum_balance} exceeded' if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    raise "Insufficient balance" if @balance < MINBALANCE
    @in_journey = true
  end
  
  def touch_out
    @in_journey = false
  end
endgi