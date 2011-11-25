<% if @comment.id %>
  oldComments = $ '#comments'
  newComments = $ '<%= j(render "products/comments", :product => @product) %>'
  $('#<%= comments_form_id @comment.parent_id %>').slideUp 'slow', =>
    oldComments.replaceWith newComments
    #replace 'Add comment' link's href
    $('#product > a[href|="#"]').attr 'href',
                                      '<%= new_product_comment_path @product,
                                          :reply_to => @product.root_comment %>'
<% else %>
  <%= params[:reply_to] = @comment.parent_id %>
  oldForm = $("#<%= comments_form_id params[:reply_to] %>")
  newForm = $('<%= j(render "form", :comment => @comment,
                            :product => @product) %>')
  newForm.css 'marginLeft', oldForm.css 'marginLeft'
  oldForm.replaceWith newForm
<% end %>
