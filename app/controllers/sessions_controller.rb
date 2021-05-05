class SessionsController < ApplicationController
  layout false
  
  skip_before_action :authorized, only: [:new, :create, :destroy]
  skip_before_action :verify_authenticity_token

  def new
  end

  def create  
    @user = User.find_by(username: params[:username])
    puts("En create session")
    if @user && @user.authenticate(params[:password])
      puts("auth ok")
      session[:user_id] = @user.id
      session[:email] = @user.email
      session[:username] = @user.username
      session[:rol] = @user.rol
      
      redirect_to posts_path
    else
      flash[:login_error] = "Login incorrecto"
      redirect_to root_path 
    end
  end

  def login
  end

  def destroy
    session[:user_id] = nil
    session[:email] = nil
    session[:username] = nil
    session[:rol] = nil

    current_user = nil
    redirect_to :root
  end

  def pages_requires_login
  end
end

