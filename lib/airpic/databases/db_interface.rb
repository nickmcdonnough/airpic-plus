module Airpic
  module DB
    class DBMethods < ARModels

      # User methods

      def build_app_user ar_user
        Airpic::User.new(ar_user.first_name, ar_user.last_name,
                         ar_user.email, ar_user.cell, ar_user.password_digest,
                         ar_user.id, ar_user.stamp_collection)
      end

      def persist_user user
      end

      def get_user_by_cell number
        ar_user = User.find_by(cell: number)
        ar_user ? build_app_user(ar_user) : nil
      end


      # Recipient methods
      
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


      # Stamp methods

      def presist_stamp amount, user_id
        user = User.find(user_id)
        user.stamp.create(amount: amount)
      end
    end

    def self.run
      @__db_instance ||= DBMethods.new
    end
  end
end
