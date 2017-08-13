class SessionsController < ApplicationController
  before_action :require_logout, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])

    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
