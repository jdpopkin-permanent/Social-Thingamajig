class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:email],
                                      params[:user][:password])
    if @user.nil?
      flash[:error] = 'Invalid email / password' # change other for consistency
      redirect_to new_session_url
    else
      # flash confirmation?
      session[:session_token] = @user.session_token
      redirect_to session_url
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil

    redirect_to root
  end


  def reset_password
    user = User.find_by_email(params[:user][:email])
    ResetMailer.password(user).deliver!

    redirect_to new_session_url
  end
end
