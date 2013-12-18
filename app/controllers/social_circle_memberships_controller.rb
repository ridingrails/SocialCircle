class SocialCircleMembershipsController < ApplicationController
  def create
    @membership = SocialCircleMembership.new
    @circle = @membership.circle
    if @membership.save
      redirect_to social_circle_url(@circle)
    else
      flash.now[:notice] = ["Not all users added to circle"]
    end
  end
end
