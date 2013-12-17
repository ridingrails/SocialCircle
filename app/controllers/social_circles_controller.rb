class SocialCirclesController < ApplicationController
  def new
    @circle = SocialCircle.new
  end

  def create
    @circle = SocialCircle.new(params[:circle])
    if @circle.save
      redirect_to social_circle_url(@circle)
    else
      flash[:errors] = @circles.errors.full_messages
      render :new
    end
  end
end
