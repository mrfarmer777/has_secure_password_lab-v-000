class UsersController < ApplicationController

  def new
  end

  def create
    #instantiate with strong_params, save to db
    user = User.new(user_params).save

  end

  prive 

  #strong params function
  def user_params
    params.require(:user).permite(:username, :password, :password_confirmation)
  end

end
