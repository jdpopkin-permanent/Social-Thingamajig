class FriendCirclesController < ApplicationController
  def new
    render :new
  end

  def create
    friend_circle = FriendCircle.new(params[:friend_circle])

    if friend_circle.save
      redirect_to friend_circle_url(friend_circle)
    else
      redirect_to new_friend_circle_url
    end
  end

  def show
    @friend_circle = FriendCircle.find(params[:id])
    render :show
  end

  def edit
    @friend_circle = FriendCircle.find(params[:id])
    render :edit
  end

  def update
    friend_circle = FriendCircle.find(params[:id])

    if friend_circle.update_attributes(params[:friend_circle])
      redirect_to friend_circle_url(friend_circle)
    else
      redirect_to edit_friend_circle_url
    end
  end

  def destroy
    friend_circle = FriendCircle.find(params[:id])
    friend_circle.destroy!

    redirect_to new_friend_circle_url
  end

end

