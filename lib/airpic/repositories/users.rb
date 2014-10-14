module Airpic
module Repositories
class Users

  class User < ActiveRecord::Base
    has_many :stamps
    has_many :orders
    has_many :cards
    has_many :recipients, dependent: :destroy

    def stamp_collection
      stamps.sum('amount')
    end
  end

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

end
end
end
