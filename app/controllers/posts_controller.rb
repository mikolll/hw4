class PostsController < ApplicationController

  def new
    if @current_user
    @post = Post.new
    @post.place_id = params["place_id"]
    end
  end

  def create
    if @current_user
      @post = Post.new
      @post["description"] = params["post"]["description"]
      @post.uploaded_image.attach(params["post"]["uploaded_image"])
      @post["user_id"] = @current_user["id"]
      @post.save
    else
      flash["notice"] = "Login first."
    end
    redirect_to "/posts"
  end  
end

