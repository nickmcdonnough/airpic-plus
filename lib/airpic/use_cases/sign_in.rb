module Airpic
  class SignIn < UseCase
    def run params
      user = Airpic::DBI.exec.find_user_by_username(params[:username])

      if user.nil?
        return failure(:no_user)
      end
      
      if !user.has_password? params[:password]
        return failure(:bad_password)
      end

      # add anything about session id?
      success user_id: user.id
    end
  end
end
