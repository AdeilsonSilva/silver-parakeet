class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    respond_to do |format|
      if user&.authenticate(params[:password])
        session[:user_id] = user.id
        format.html { redirect_to @user, notice: 'Login com sucesso.' }
        # format.js { render js: "window.location = '#{authenticated_root_path}'" }
      else
        format.json { render json: { success: false, error: 'E-mail ou senha incorretos' } }
      end
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
