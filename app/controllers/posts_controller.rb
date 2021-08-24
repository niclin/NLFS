class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_post, only: [:edit, :update, :show]

  def index
  end

  def show
    @post_attachments = @post.post_attachments.all
  end

  def new
    @post = Post.new
    @post_attachment = @post.post_attachments.build
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      binding.pry
      params[:post_attachments]['image'].each do |a|
          @post_attachment = @post.post_attachments.create!(:image => a,     :post_id => @post.id)
      end
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render action: 'new'
    end
end

  def edit
  end

  def update
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :store, :front_brake_caliper, :front_wheel_rim, :front_shock, :back_brake_caliper, :back_wheel_rim, :back_shock, :drive_line_system, :engine_system, :exhaust_pipe, :appearance, :others, :comment, post_attachments_attributes: [:id, :post_id, :image])
  end
end
