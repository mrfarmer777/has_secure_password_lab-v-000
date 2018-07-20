class SessionsController < ApplicationController
  #this is like the bouncer, asks for ID, checks against criteria and creates a session (wristband)

  def create
    #You said you're 'username', huh? Let's see if you're on the list...
    @user=User.find_by(username: params[:username])

    #You're forbidden unless the password you supplied in the params(when salted and hashed)  matches that  
    #which was previously salted and hashed for your username in the database
    return head(:forbidden) unless @user.authenticate(params[:password])
    #if you passed the previous step, here's your wristband. Drink away and don't be an idiot.
    session[:user_id] = @user.id
  end
end
