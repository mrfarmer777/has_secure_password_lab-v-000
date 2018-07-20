class UsersController < ApplicationController

  def new
  end

  def create
    #instantiate with strong_params, save to db
    #one of these params is password and password_confirmation, I believe when the User class creates a new
    #user, it will use the has_secure_password macro to create the password digest before actually saving it....
    #this should be baked in
    if user_params[:password]==user_params[:password_confirmation]
      @user = User.new(user_params)
      @user.save
      session[:user_id]=@user.id
      redirect_to user_path(@user.id)
    else
      redirect_to new_user_path
    end
  end

  def show
    @user=User.find(session[:user_id])
  end

  private

  #strong params function
  def user_params
    #the form is sending back a user hash within params taht includes username, passowrd, and password_confirmation
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
