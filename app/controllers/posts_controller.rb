class PostsController < ApplicationController
  before_action :find_post, only: [:show]

  def index
    @posts = Post.approved
  end

  def show
    @post_attachments = @post.post_attachments.all
    set_meta_tags title: "[便友帥車] #{@post.title}",
                  og: {
                    image: @post_attachments.first.image.og.url
                  }
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end
end
