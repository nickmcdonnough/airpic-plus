module AirpicWeb
  module Routes
    class Webhook < Core
      post '/webhook/order' do
        # validate sender
        # validate recipient
        # process photo
        # parse message
        # deduct stamps
        # send order to lob
      end
    end
  end
end
