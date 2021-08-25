class PostsController < ApplicationController
  before_action :find_post, only: [:show]

  def index
    @posts = Post.approved
  end

  def show
    @post_attachments = @post.post_attachments.all
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end
end
