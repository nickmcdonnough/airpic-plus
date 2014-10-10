require 'spec_helper.rb'

describe Airpic::Card do
  let(:card) do
    data = {
      user_id: 1,
      storage_url: 'https://example.com/bucket/test.png',
      order_ids: ['fake_lob_tx_id']
    }
    Airpic::Card.new(data)
  end

  it 'exists' do
    expect(card).to be_a(Airpic::Card)
  end

  it 'has a user id and a storage url' do
    expect(card.user_id).to_not be_nil
    expect(card.storage_url).to_not be_nil
  end

  it 'contains a list of order id\'s for the card' do
    expect(card.order_ids).to be_a(Array)
    expect(card.order_ids.first).to be_a(String)
  end
end
