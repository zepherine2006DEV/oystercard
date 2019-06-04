require 'oystercard'



describe Oystercard do

  before(:each) do
    @topped_up = Oystercard.new
    @topped_up.top_up(10)  
  end
  
  let(:station) { double("station") }

  it 'saves the entry station to an instance variable when touched in' do
    @topped_up.touch_in(station)
    expect(@topped_up.entry_station).to eql(station)
  end

  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'can top up the balance' do
      expect{ subject.top_up 1}.to change{ subject.balance }.by 1
    end

    it 'raises an error if the maximum balance is exceeded' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up(maximum_balance)
      expect{ subject.top_up 1 }.to raise_error 'Maximum balance of #{maximum_balance} exceeded'
    end
  end

  it 'is initially not in a journey' do
    expect(subject).not_to be_in_journey
  end
  it 'can touch in at barriers' do
    @topped_up.touch_in(station)
    expect(@topped_up).to be_in_journey
  end

  it 'can touch out' do
    @topped_up.touch_in(station)
    @topped_up.touch_out(station)
    expect(@topped_up).not_to be_in_journey
  end
  it 'raises an error when tapped in with insufficient funds' do
    expect { subject.touch_in(station) }.to raise_error 'Insufficient balance'
  end
  it 'reduces the balance by the minimum fare when touched out' do
    minimum_balance = Oystercard::MINBALANCE
    expect { @topped_up.touch_out(station) }.to change { @topped_up.balance }.by -minimum_balance
  end

  it 'stores the station in journey history on touch out' do
    @topped_up.touch_in(station)
    @topped_up.touch_out(station)
    journey_result = [{:entry_station => station, :exit_station => station}]
    expect(@topped_up.journeys).to eql(journey_result)  
  end

  it 'creates an empty list of journeys on intialisation' do
    expect(subject.journeys).to eq([])
  end
  
end