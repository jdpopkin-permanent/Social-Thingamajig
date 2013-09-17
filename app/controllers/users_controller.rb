class UsersController < ApplicationController
  #before_filter make sure user is not already logged in


  def new
    render :new
  end

  def create
    @user = User.new(params[:user])

    if @user.save

      redirect_to session_url
    else
      flash.now[:errors] ||= []
      flash.now[:errors] << @user.errors.full_messages

      render :new
    end
  end

  def edit

  end

  def update

  end

end
