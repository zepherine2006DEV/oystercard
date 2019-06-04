class Oystercard

  MAXIMUM_BALANCE = 90
  
  MAXBALANCE = 90
  MINBALANCE = 1
  attr_reader :balance, :entry_station, :journeys
  
  def initialize
    @balance = 0
    @entry_station = nil
    @journeys = []
  end

  def top_up(amount)
    fail 'Maximum balance of #{maximum_balance} exceeded' if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def in_journey?
    @entry_station
  end

  def touch_in(station)
    raise "Insufficient balance" if @balance < MINBALANCE
    @entry_station = station
  end
  
  def touch_out(station)
    deduct(MINBALANCE)
    journeys << {:entry_station => @entry_station, :exit_station => station}
    @entry_station = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end