class SessionsController < ApplicationController
    skip_before_action :authenticate_user, only: [:create, :destroy]

    # POST '/login' - create a new session (not create a USER)
    def create
      user = User.find_by(username: params[:username])
     
      # authenticate is a new method given to us by Bcrypt. It checks the password passed in if it's the correct password
      
        if user&.authenticate(params[:password])
          session[:user_id] = user.id
          render json: user, status: :created
      
      else
        render json: { errors: ["Username or Password did not match."] }
      end
    end
    
    #DELETE '/logout' - destroy the session
    def destroy
      session.delete(:user_id)
      render json: { errors: ["Successfully logged out"]}, status: :ok
    end
end
