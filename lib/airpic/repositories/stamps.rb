module Airpic
module Repositories
class Stamps

  class Stamp < ActiveRecord::Base
    validates :quantity, numericality: true
    validates :date, numericality: true
    belongs_to :user
  end

  def persist_stamp amount, user_id
    user = User.find(user_id)
    user.stamp.create(amount: amount)
  end

end
end
end
