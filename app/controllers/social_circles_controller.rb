class SocialCirclesController < ApplicationController
  def index
    @circles = SocialCircle.all
  end

  def new
    @users = User.all
    @circle = SocialCircle.new
  end

  def create
    @circle = SocialCircle.new(params[:circle])
    if @circle.save
      redirect_to social_circle_url(@circle)
    else
      flash[:errors] = @circle.errors.full_messages
      render :new
    end
  end

  def edit
    @users = User.all
    @circle = SocialCircle.find(params[:id])
  end

  def update
    @circle = SocialCircle.find(params[:id])
    if @circle.update_attributes(params[:circle])
      redirect_to social_circle_url(@circle)
    else
      flash[:errors] = @circle.errors.full_messages
      render :edit
    end
  end

  def show
    @circle = SocialCircle.find(params[:id])
  end
end
