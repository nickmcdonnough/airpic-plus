module Airpic
module Repositories
class Recipients

  class Recipient < ActiveRecord::Base
    validates_presence_of :nickname, :name, :address_line1, :city, :state, :zip
    belongs_to :user
  end

  def build_app_recipient ar_recipient
    Airpic::Recipient.new(nickname: ar_recipient.nickname,
                          name: ar_recipient.name,
                          address_line1: ar_recipient.address_line1,
                          address_line2: ar_recipient.address_line2,
                          city: ar_recipient.city,
                          state: ar_recipient.state,
                          zip: ar_recipient.zip,
                          lob_id: ar_recipient.lob_id)
  end

  def persist_recipient recipient
    Recipient.create(nickname: recipient.nickname,
                     name: recipient.name,
                     address_line1: recipient.address_line1,
                     address_line2: recipient.address_line2,
                     city: recipient.city,
                     state: recipient.state,
                     zip: recipient.zip,
                     lob_id: recipient.lob_id)
  end

  def get_recipient_by_nickname nickname
    recipient = Recipient.find_by(nickname: nickname)
    recipient ? recipient : nil
  end

end
end
end
