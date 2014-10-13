module AirpicWeb
module Routes

class Users < Core
  get '/signin' do
    erb :signin
  end

  get '/signup' do
    erb :signup
  end

  post '/signin' do
    result = AirPic::UseCases::SignIn.run(params)

    if result.success?
      grant_session_to_user(result)
    else
      # flash message about 
      redirect to '/signin'
    end
  end

  post '/signup' do
    result = AirPic::UseCases::SignUp.run(params)

    if result.success?
      grant_session_to_user(result)
    else
      # flash message about failed signup
      redirect to '/signup'
    end
  end

  def grant_session_to_user(auth_result)
    session_id = AirPic::UseCases::Session.run(result)
    session[:airpic] = session_id
  end
end

end
end
