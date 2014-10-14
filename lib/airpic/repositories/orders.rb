module Airpic
module Repositories

  class Order < ActiveRecord::Base
    belongs_to :user
    has_one :card
  end

end
end
