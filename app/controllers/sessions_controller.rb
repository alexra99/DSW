class SessionsController < ApplicationController
  layout false
  
  skip_before_action :authorized, only: [:new, :create]
  skip_before_action :verify_authenticity_token

  def new
    #@user = User.find(7)   
    puts("ESTOY EN NEW")
  end

  def create  
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to posts_path
    else
      redirect_to root_path
    end
  end

  def login
  end

  def destroy
    session[:user] = nil
    current_user = nil
    redirect_to :root
  end

  def pages_requires_login
  end
end

