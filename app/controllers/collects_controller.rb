class CollectsController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]
    
    def index
        @collects = Collect.all
        @posts = Post.all

    end
    
    def show
        @collect = Collect.find(params[:id])
        @posts = Post.all
        if @collect.user_id != session[:user_id] && session[:rol] != "admin"
            flash[:edit_collect_error] = "You can't view other user's collection"
            redirect_to collects_path, :alert => "You can't edit a post that is not yours :("
        end 
    end
    
    def new
        @collect = Collect.new
    end
    
    def create
        
        collect_params2 = collect_params
        collect_params2["user_id"] = current_user.id
        @collect = Collect.new(collect_params2)
        if @collect.save
            redirect_to collects_path, :notice => "Collect created!!"
        else
            render 'new'
        end
    end
    
    def edit
        @collect = Collect.find(params[:id])
        @user = User.find(session[:user_id])

        if @collect.user_id != session[:user_id] && @user.rol != 'admin'
            flash[:edit_collect_error] = "You can't edit other user's collect"
            redirect_to collects_path, :alert => "You can't edit a collect that is not yours :("
        end
    end
    
    def update
        @collect = Collect.find(params[:id])
        if @collect.update(collect_params)
            redirect_to collects_path, :notice => "Collect edited!!"
        else
            render 'edit'
        end
    end
    
    def destroy
        @collect = Collect.find(params[:id])
        @collect.destroy
        redirect_to  collects_path, :notice => "Collect deleted!!"
    end
    
    private def collect_params
        params.require(:collect).permit(:name, :user_id)
    end
    

end
