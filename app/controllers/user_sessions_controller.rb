class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

    def create
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to '/', notice: "Logged in!"
      else
        flash.now[:alert] = "Invalid email or password"
        render "new"
      end
    end

  def destroy
    logout
    redirect_to root_url, notice: 'Logged out!'
  end
end
