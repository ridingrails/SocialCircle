class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:email],
                                     params[:user][:password])
    if @user
      session[:token] = @user.reset_token!
      redirect_to social_circles_url
    else
      flash[:errors] = ["Invalid email or password"]
      render :new
    end
  end

  def destroy
    session[:token] = nil
    current_user.reset_token!
  end
end
