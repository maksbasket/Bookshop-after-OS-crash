module CommentsHelper
  
  def comments_form_id(reply_to)
    "reply_to_#{reply_to}"
  end

  def comment_id(id)
      "comment_#{id}"
  end

  def comment_style(level)
    "margin-left: #{2 * level}em"
  end

  def comment_li(comment, level)
    content_tag :li, :id => comment_id(comment.id),
                :style => comment_style(level) do
      yield
    end 
  end
end
