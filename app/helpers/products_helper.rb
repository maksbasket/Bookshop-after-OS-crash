module ProductsHelper
  def link_to_new_comment(content, product, reply_to=nil)
    reply_to ||= product.root_comment
    link_to content, new_product_comment_path(product, :reply_to => reply_to),
            :remote => true
  end
end
