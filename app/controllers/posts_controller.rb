class PostsController < ApplicationController

  def new
    render :new
  end

  def create
    begin
      ActiveRecord::Base.transaction do
        @post = Post.create(params[:post])
        urls = params[:link][:url]
        #fail
        links = []

        urls.each do |url|
          next if url == ""
          links << Link.create(url: url, post_id: @post.id)
        end

        raise "Something is wrong" unless @post.valid? && links.all? { |link| link.valid? }
      end
    rescue
      fail
      render :new
    else
      redirect_to post_url(@post)
    end
  end

  def show
    @post = Post.find(params[:id])

    render :show
  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def update
    @post = Post.find(params[:id])

    @post.update_attributes(params[:post])
    # WARNING THIS DOESN'T WORK
  end
end
