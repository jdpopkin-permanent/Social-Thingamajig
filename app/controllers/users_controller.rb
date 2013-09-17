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
    @user = User.find(params[:id])
    @key = params[:key]
    if @user.reset_key == params[:key]
      render :edit
    else
      redirect_to new_session_url
    end
  end

  def update
    user = User.find(params[:id])
    user.password = params[:user][:password]
    if user.save
      redirect_to new_session_url
    else
      @user = user

      render :edit
    end
  end

end
