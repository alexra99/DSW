class UsersController < ApplicationController
  def index
      @users = user.all
  end

  def show
      @user = user.find(params[:id])
  end

  def new
      @user = user.new
  end

  def create
      @user = user.new(user_params)
      if @user.save
          redirect_to users_path, :notice => "user created!!"
      else
          render 'new'
      end
  end

  def edit
      @user = user.find(params[:id])
  end

  def update
      @user = user.find(params[:id])
      if @user.update(user_params)
          redirect_to users_path, :notice => "user edited!!"
      else
          render 'edit'
      end
  end

  def destroy
      @user = user.find(params[:id])
      @user.destroy
      redirect_to users_path, :notice => "user deleted!!"
  end

  private def user_params
      params.require(:user).permit(:title, :content)
  end

end