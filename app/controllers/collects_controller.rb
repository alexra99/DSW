class CollectsController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]
    
    def index
        @collects = Collect.all
        @posts = Post.all
        
    end
    
    def show
        
        @post = Post.find(params[:id])
        if @post.user_id != session[:user_id]
            flash[:edit_post_error] = "You can't view other user's note"
            redirect_to posts_path, :alert => "You can't edit a post that is not yours :("
        end
    end
    
    def new
        @post = Post.new
    end
    
    def create
        
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
        @post = Post.find(params[:id])
        if @post.user_id != session[:user_id]
            flash[:edit_post_error] = "You can't edit other user's note"
            redirect_to posts_path, :alert => "You can't edit a post that is not yours :("
        end
    end
    
    def update
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
        params.require(:post).permit(:title, :content, :user_id)
    end
    

end
