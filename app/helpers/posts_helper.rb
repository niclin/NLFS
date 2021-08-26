module PostsHelper

  def render_preview_title(post)
    case post.status
    when "draft"
      "草稿"
    when "submitted"
      "已送出"
    when "approved"
      "審核通過"
    else
      "ERROR"
    end
  end

  def render_preview_bar_css_color(post)
    case post.status
    when "draft"
      "bg-secondary"
    when "submitted"
      "bg-warning"
    when "approved"
      "bg-success"
    else
      "bg-info"
    end
  end
end
