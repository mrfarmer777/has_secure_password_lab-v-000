class SessionsController < ApplicationController
  #this is like the bouncer, asks for ID, checks against criteria and creates a session (wristband)

  def new
  end

  def create
    #You said you're 'username', huh? Let's see if you're on the list...
    @user=User.find_by(name: params[:user][:name])
    if @user
      #You're forbidden unless the password you supplied in the params(when salted and hashed)  matches that
      #which was previously salted and hashed for your username in the database
      return head(:forbidden) unless @user.authenticate(params[:user][:password])
      #if you passed the previous step, here's your wristband. Drink away and don't be an idiot.
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to login_path
    end
  end
end
