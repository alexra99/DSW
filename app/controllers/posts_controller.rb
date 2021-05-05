class PostsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def index
    @posts = Post.all
    @collects = Collect.all
  end

  def show
      @post = Post.find(params[:id])
      if @post.user_id != session[:user_id] && session[:rol] != "admin"
          flash[:edit_post_error] = "You can't view other user's note"
          redirect_to posts_path, :alert => "You can't edit a post that is not yours :("
      end
  end

  def new
      @post = Post.new
      @collects = Collect.all
  end

  def create
    @collects = Collect.all

    post_params2 = post_params
    post_params2["user_id"] = current_user.id
    
    @post = Post.new(post_params2)

    if @post.save
        redirect_to posts_path, :notice => "Post created!!"
    else
        render 'new'
    end
  end

  def edit
    @collects = Collect.all
    @post = Post.find(params[:id])
    @user = User.find(session[:user_id])

    if @post.user_id != session[:user_id] && @user.rol != 'admin'
        flash[:edit_post_error] = "You can't edit other user's note"
        redirect_to posts_path, :alert => "You can't edit a post that is not yours :("
    end
  end

  def update
    @collects = Collect.all
    @post = Post.find(params[:id])
      if @post.update(post_params)
          redirect_to posts_path, :notice => "Post edited!!"
      else
          render 'edit'
      end
  end

  def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to  posts_path, :notice => "Post deleted!!"
      puts("en destroy")

  end

  private def post_params
      params.require(:post).permit(:title, :content, :user_id, :collect_id, :photo)
  end

end