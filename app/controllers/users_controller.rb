class UsersController < ApplicationController
    layout false, :except => [:show,:edit,:index]
  
    skip_before_action :authorized, only: [:new, :create]
    skip_before_action :verify_authenticity_token

  def index
      @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
      @user = User.new
  end

  def create
      @user = User.create(user_params)
      
      session[:user_id] = @user.id

      redirect_to '/login'
  end


  def edit
    @user = User.find(params[:id])
    if @user.id != session[:user_id]
        flash[:edit_user_error] = "You can't edit other user"  
        
        redirect_to users_path, :alert => "You can't edit a user that is not yours :("
    end
  end

  def update
      @user = User.find(params[:id])
      puts("Usuario en update")
      if @user.update(user_params)
        redirect_to users_path, :notice => "user edited!!"
      else
        
        render 'edit'
      end
  end

  def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to users_path, :notice => "user deleted!!"
      puts("en destroy")
  end

  private def user_params
      params.require(:user).permit(:username, :password, :email, :rol)
  end

end
