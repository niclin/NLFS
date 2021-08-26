class Admin::PostsController < Admin::BaseController
  def index
    @posts = Post.all.recent
  end

  def show
    @post = Post.find(params[:id])
    @post_attachments = @post.post_attachments.all
  end

  def approve
    @post = Post.find(params[:id])

    if @post.approved!
      redirect_back(fallback_location: admin_post_path(@post), notice: "PostID: #{@post.id} 更新成功！")
    else
      redirect_back(fallback_location: admin_posts_path, alert: "PostID: #{@post.id} 更新失敗！")
    end
  end
end
