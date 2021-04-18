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
      #session[:user_id] = @user.id
      puts("HOLA")
      redirect_to user_posts_path(@user.id)
    else
      puts("PAL LOGIN")
      #redirect_to '/login'
    end
  end

  def login
  end

  def pages_requires_login
  end
end

