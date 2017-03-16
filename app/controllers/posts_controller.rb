class PostsController < ApplicationController
  def index
    @posts = []
    Post.all.each do |post|
      post.title = "SPAM" if post.id.to_i % 5 == 0
      @posts << post
    end
  end

  def show
  end

  def new
  end

  def edit
  end
end
