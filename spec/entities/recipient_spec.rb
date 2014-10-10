require 'spec_helper.rb'

describe Airpic::Recipient do
  let(:recipient) do
    data = {
      id: 1,
      name: 'John Q Test',
      nickname: 'johnq',
      addr_line1: '9 Carriage Lane',
      addr_line2: '',
      city: 'Codetopia',
      state: 'NY',
      zip: '09823',
      lob_id: 'fake_lob_addr_id'
    }
    Airpic::Recipient.new(data)
  end

  it 'exists' do
    expect(recipient).to be_a(Airpic::Recipient)
  end

  it 'has a name and id' do
    expect(recipient.id).to_not be_nil
    expect(recipient.name).to_not be_nil
  end

  it 'has an address' do
    expect(recipient.addr_line1).to_not be_nil
    expect(recipient.addr_line2).to_not be_nil
    expect(recipient.city).to_not be_nil
    expect(recipient.state).to_not be_nil
  end

  it 'has a properly formatted zipcode' do
    expect(recipient.zip).to be_a(String)
    expect(recipient.zip.size).to eq(5)
  end

  it 'as a lob id' do
    expect(recipient.lob_id).to_not be_nil
  end
end
