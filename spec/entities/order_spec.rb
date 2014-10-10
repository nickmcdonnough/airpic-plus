require 'spec_helper.rb'

describe Airpic::Order do
  let(:order) do
    data = {
      user_id: 1,
      recipient_id: 2,
      card_id: 3,
      order_id: 'fake_lob_tx_id'
    }
    Airpic::Order.new(data)
  end

  it 'exists' do
    expect(order).to be_a(Airpic::Order)
  end

  it 'has a user id and a recipient id' do
    expect(order.user_id).to_not be_nil
    expect(order.recipient_id).to_not be_nil
  end

  it 'has a card id for the photo shipped' do
    expect(order.card_id).to_not be_nil
  end
end
