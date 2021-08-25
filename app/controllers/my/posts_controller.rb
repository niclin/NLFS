class My::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: [:edit, :update, :preview, :submit]

  def new
    @post = current_user.build_post
    @post_attachment = @post.post_attachments.build
  end

  def create
    @post = current_user.build_post(post_params)

    if @post.save
      params[:post_attachments]['image'].each do |a|
        @post_attachment = @post.post_attachments.create!(:image => a, :post_id => @post.id)
      end
      redirect_to preview_my_post_path, notice: 'Post was successfully created.'
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    @post.status = "draft"

    if @post.update(post_params)
      redirect_to preview_my_post_path, notice: 'Post was successfully created.'
    else
      render :edit
    end
  end

  def preview
    @post_attachments = @post.post_attachments.all
  end

  def submit
    if @post.update!(status: "submitted")
      redirect_to preview_my_post_path, notice: '已提交審核，請耐心等候。'
    else
      render "preview"
    end
  end

  private

  def find_post
    @post = current_user.post
  end

  def post_params
    params.require(:post).permit(:title, :store, :front_brake_caliper, :front_wheel_rim, :front_shock, :back_brake_caliper, :back_wheel_rim, :back_shock, :drive_line_system, :engine_system, :exhaust_pipe, :appearance, :others, :comment, post_attachments_attributes: [:id, :post_id, :image])
  end
end
