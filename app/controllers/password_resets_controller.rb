class PasswordResetsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_email(params[:user][:email])
    email = UserMailer.reset_password_email(@user)
    email.deliver!
    redirect_to new_session_url
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to new_session_url
    else
      flash[:errors] = @user.errors.full_messages
      render :edit
    end
  end
end
