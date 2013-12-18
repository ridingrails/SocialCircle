class PostSharesController < ApplicationController
  def create
    @post_share = PostShare.new
    @post = @post_share.post
    if @post_share.save
      redirect_to post_url(@post)
    else
      flash.now[:notice] = ["Couldn't share post with all circles"]
    end
  end

  def feed
    circles = current_user.circles
    @feed_posts = []
    circles.each do |circle|
      @feed_posts.concat(circle.posts)
    end
  end
end
