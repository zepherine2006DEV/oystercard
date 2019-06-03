require 'oystercard'

describe Oystercard do
  it 'responds to the balance method' do
    expect(subject).to respond_to(:balance)
  end
  it 'increases the balance of the card when the top_up method is used' do
    card = Oystercard.new
    card.top_up(10)
    expect(card.balance).to eql(10)
  end
end