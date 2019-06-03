require 'oystercard'

describe Oystercard do
  it 'responds to the balance method' do
    expect(subject).to respond_to(:balance)
  end
end