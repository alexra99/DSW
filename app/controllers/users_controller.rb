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
    puts("en update")
      @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:edit_user_success] = "User changed successfully!!"  
        redirect_to user_path(@user.id), :notice => "user edited!!"
      else
        flash[:edit_user_error] = "New password and confirmation password are not the same"  
        redirect_to edit_user_path(@user.id)
      end
  end

  def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to users_path, :notice => "user deleted!!"
  end

  private def user_params
      params.require(:user).permit(:username, :password, :email, :rol, :password_confirmation)
  end

end
