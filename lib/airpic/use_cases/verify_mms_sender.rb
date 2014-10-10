module Airpic
  class VerifyMMSSender < UseCase
    def run params
      incoming_mobile = params['msisdn']
      
      if incoming_mobile[0] == '1'
        incoming_mobile = incoming_mobile[1..-1]
      end

      sender = Airpic::DB.run.get_sender_by_mobile(incoming_mobile)

      if sender.nil?
        return failure error: :no_such_sender
      end

      success sender_id: sender.id
    end
  end
end
