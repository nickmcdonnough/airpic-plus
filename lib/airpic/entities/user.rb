module Airpic
  class User
    attr_reader :id, :first_name, :last_name,
                :email, :cell, :password_digest,
                :stamp_balance

    def initialize first_name, last_name, email, cell,
                   password_digest=nil, id=nil, stamp_balance=nil
      @id = id
      @cell = cell
      @email = email
      @first_name = first_name
      @last_name = last_name
      @password_digest = password_digest
      @stamp_balance = stamp_balance
    end
              
    def update_password password
    end

    def has_password? password
    end
  end
end
