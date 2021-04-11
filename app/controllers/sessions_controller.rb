class SessionsController < ApplicationController
  layout false
  
  skip_before_action :authorized, only: [:new, :create, :welcome]
  skip_before_action :verify_authenticity_token

  def new
  end

  def create
    @user = User.find_by(username: params[:username])

    if @user
      session[:user_id] = @user.id
      redirect_to '/posts'
    else
      redirect_to '/login'
    end
  end

  def login
  end

  def pages_requires_login
  end
end
