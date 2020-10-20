class SessionsController < ApplicationController
  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
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
