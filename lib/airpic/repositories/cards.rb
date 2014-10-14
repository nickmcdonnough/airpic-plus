module Airpic
moudle Repositories

  class Card < ActiveRecord::Base
    belongs_to :user
    belongs_to :order
  end

end
end
