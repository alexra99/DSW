
class PostsController < ApplicationController

  def index
    @user =  User.find_by(id: session[:user_id])
    puts("Posts: #{@user.id}")
    @posts = Post.all
  end

  def show
    @user =  User.find(params[:user_id])
      @post = Post.find(params[:id])
      puts(params[:id])
  end

  def new
      @post = Post.new
  end

  def create
    @user =  User.find(params[:user_id])
    post_paramsdwaaw = post_params
    post_paramsdwaaw["user_id"] = @user.id
    @post = Post.new(post_paramsdwaaw)
      if @post.save
          redirect_to user_posts_path(@user.id), :notice => "Post created!!"
      else
          render 'new'
      end
  end

  def edit
      @post = Post.find(params[:id])
  end

  def update
    @user =  User.find(params[:user_id])
      @post = Post.find(params[:id])
      if @post.update(post_params)
          redirect_to user_posts_path(@user.id), :notice => "Post edited!!"
      else
          render 'edit'
      end
  end

  def destroy
    @user =  User.find(params[:user_id])
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to  user_posts_path(@user.id), :notice => "Post deleted!!"
      puts("en destroy")

  end

  private def post_params
      params.require(:post).permit(:title, :content, :user_id)
  end

end