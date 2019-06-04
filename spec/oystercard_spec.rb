require 'oystercard'

describe Oystercard do
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
    subject.top_up(10)
    subject.touch_in
    expect(subject).to be_in_journey
  end

  it 'can touch out' do
    subject.top_up(10)
    subject.touch_in
    subject.touch_out
    expect(subject).not_to be_in_journey
  end
  it 'raises an error when tapped in with insufficient funds' do
    expect { subject.touch_in }.to raise_error 'Insufficient balance'
  end
  it 'reduces the balance by the minimum fare when touched out' do
    minimum_balance = Oystercard::MINBALANCE
    subject.top_up(10)
    expect { subject.touch_out }.to change { subject.balance }.by -minimum_balance
  end



end