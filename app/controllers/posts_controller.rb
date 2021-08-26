class PostsController < ApplicationController
  before_action :find_post, only: [:show]

  def index
    @posts = Post.approved
  end

  def show
    @post_attachments = @post.post_attachments.all
    set_meta_tags title: @post.title,
                  description: @post.comment,
                  keywords: "#{@post.store}, #{@post.front_brake_caliper}, #{@post.front_wheel_rim}, #{@post.front_shock}, #{@post.back_brake_caliper}, #{@post.back_wheel_rim}, #{@post.back_shock}",
                  og: {
                    image: @post_attachments.first.image.og.url
                  }
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end
end
