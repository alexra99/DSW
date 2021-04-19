
class PostsController < ApplicationController
  skip_before_action :authorized

  def index
    @posts = Post.all
  end

  def show
      @post = Post.find(params[:id])
      puts(params[:id])
  end

  def new
      @post = Post.new
  end

  def create
    
    post_params2 = post_params
    post_params2["user_id"] = current_user.id
    @post = Post.new(post_params2)
      if @post.save
          redirect_to user_posts_path(current_user.id), :notice => "Post created!!"
      else
          render 'new'
      end
  end

  def edit
      @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
      if @post.update(post_params)
          redirect_to user_posts_path(current_user.id), :notice => "Post edited!!"
      else
          render 'edit'
      end
  end

  def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to  user_posts_path(current_user.id), :notice => "Post deleted!!"
      puts("en destroy")

  end

  private def post_params
      params.require(:post).permit(:title, :content, :user_id)
  end

end