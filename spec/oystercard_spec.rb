require 'oystercard'

describe Oystercard do
  it 'responds to the balance method' do
    expect(subject).to respond_to(:balance)
  end
  it 'increases the balance of the card when the top_up method is used' do
    subject.top_up(10)
    expect(subject.balance).to eql(10)
  end
  it 'raises an error if the balance goes above £90' do
    expect { subject.top_up(100) }.to raise_error 'Reached limit £90'
  end
  it 'deducts the money from balance' do
    subject.top_up(20)
    expect(subject.deduct(10)).to eql(10)
  end
end