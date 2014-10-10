module Airpic
  class VerifyRecipient < UseCase
    def run params
      nickname = incoming['message'].split[1].downcase.gsub(/\W/, '')
      recipient = Airpic::DB.run.find_recipient_by_name(nickname)
      
      if !recipient
        return failure error: :no_such_recipient
      end
      
      success recipient_lob_id: recipient.lob_id
    end
  end
end

