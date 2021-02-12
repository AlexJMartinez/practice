class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      helpers.log_in user
      redirect_to user
    else
      render 'new'
    end
  end

  def facebook
        user = User.find_or_create_by(email: auth['info']['email']) do |user|
          user.username = auth['info']['name']
          user.email = auth['info']['email']
          user.password = SecureRandom.hex(10)
        end
            helpers.log_in user
            redirect_to user
    end

    

  def destroy
      helpers.log_out
      redirect_to home_path
  end

  private
 
    def auth
        request.env['omniauth.auth']
    end

end
