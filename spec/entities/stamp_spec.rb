require 'spec_helper.rb'

describe Airpic::Stamp do
  let(:stamp) do
    data = {
      user_id: 1,
      storage_url: 'https://example.com/bucket/test.png',
      order_ids: ['fake_lob_tx_id']
    }
    Airpic::Stamp.new(data)
  end

  it 'exists' do
    expect(stamp).to be_a(Airpic::Stamp)
  end

  it 'has a user id and a storage url' do
    expect(stamp.user_id).to_not be_nil
    expect(stamp.storage_url).to_not be_nil
  end

  it 'contains a list of order id\'s for the stamp' do
    expect(stamp.order_ids).to be_a(Array)
    expect(stamp.order_ids.first).to be_a(String)
  end
end
