class UsersController < ApplicationController
    skip_before_action :authenticate_user, only: [:create]


    #GET /users
  def index
    @users=User.all
    render @users
  end

  #GET/ users/1
  def show 
    #get current user
    @user= User.find_by(id: session[:user_id])
    if @user
      render json: @user, status: :ok

    else
      render json: {error: "Not auhorized"}, status: :unauthorized
  end
end

  # POST /signup - create account and log in user 
  def create
    @user = User.create!(user_params)
    if @user.valid?
      # logs in user
      session[:user_id] = @user.id # login/remembering who our user is
      render json: @user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  #PATCH/PUT 
  def update
    if @user.update(user_params)
        render json: @user
    else
        render json: @user.errors, status: :unprocessable_entity
    end
end

  #delete/users/1
  def destroy
    @user.destroy
  end

  private
  #only allow a list of trusted parameters through
    def user_params
      params.permit(:username, :password)
    end
end
