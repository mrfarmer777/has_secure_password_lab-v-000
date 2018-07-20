class UsersController < ApplicationController

  def new
  end

  def create
    #instantiate with strong_params, save to db
    user = User.new(user_params).save

  end

end
