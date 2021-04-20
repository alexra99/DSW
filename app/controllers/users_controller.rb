class UsersController < ApplicationController
    layout false
  
    skip_before_action :authorized

  def index
      @users = User.all
  end

  def show
    @user = User.find(params[:id])
    puts("Users: #{@user.id}")
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
     
  end

  def update
      @user = User.find(params[:id])
      if @user.update(user_params)
          redirect_to users_path, :notice => "user edited!!"
      else
          render 'edit'
      end
  end

  def destroy
      @user = User.find(params[:id])
      puts(" AAAAAAAAAAAAAAAAAAAAAAAAa #{@user.id}, #{@user.username}")
      @user.destroy
      redirect_to root_path, :notice => "user deleted!!"
      puts("en destroy")
  end

  private def user_params
      params.require(:user).permit(:username, :password, :email, :rol)
  end

end
