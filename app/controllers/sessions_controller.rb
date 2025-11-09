class SessionsController < ApplicationController
  layout "auth", only: %i[new create]

  def new
  end

  def create
    user = User.find_by(email: session_params.fetch('user_name').downcase)
    if user&.authenticate(session_params.fetch('password'))
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Successfully logged in!'
    else
      flash.now[:alert] = 'Invalid email/password combination'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: 'Successfully logged out!'
  end

  private
  def session_params
    params.require(:session).permit(:user_name, :password)
  end
end
