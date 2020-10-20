class SessionsController < ApplicationController
  def create
    user = User.authenticate_with_credentials(session_params[:email], session_params[:password])
    if user
      session[:user_id] = user.id
      redirect_to '/'
    else
      raise 'session user', user
      flash[:error] = 'Invalid credentials'
      redirect_to '/login'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/login'
  end


  private

  def session_params
    params.require(:sessions).permit(
      :email,
      :password
    )
  end

end
