require 'active_record'

module Airpic
  class ARModels
    class User < ActiveRecord::Base
      has_many :stamps
      has_many :orders
      has_many :cards
      has_many :recipients, dependent: :destroy

      def stamp_collection
        stamps.sum('amount')
      end
    end

    class Recipient < ActiveRecord::Base
      validates_presence_of :nickname, :name, :address_line1, :city, :state, :zip
      belongs_to :user
    end

    class Stamp < ActiveRecord::Base
      validates :quantity, numericality: true
      validates :date, numericality: true
      belongs_to :user
    end

    class Order < ActiveRecord::Base
      belongs_to :user
      has_one :card
    end

    class Card < ActiveRecord::Base
      belongs_to :user
      belongs_to :order
    end
  end
end
