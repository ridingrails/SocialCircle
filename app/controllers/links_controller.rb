class LinksController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @link = Link.new
  end

  def create
    params[:link][:post_id] = params[:post_id]
    @link = Link.new(params[:link])
    if @link.save
      redirect_to post_url(params[:post_id])
    else
      flash[:errors] = @link.errors.full_messages
    end
  end
end
