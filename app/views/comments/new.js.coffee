form = $ '<%= j(render "form", :comment => @comment, :product => @product) %>'
form.css 'display', 'none'

replyTo = $ "#<%= comment_id params[:reply_to] %>"
#if comment replied product
if replyTo.length == 0
  $('#comments').prepend form
else
  form.css 'marginLeft', replyTo.css 'marginLeft'
  form.insertAfter replyTo

#make link to slide up/down the form
a = $('a[href|="<%= new_product_comment_path @product, :reply_to => params[:reply_to] %>"]')
a.attr 'href', '#'

toggleForm = (form) ->
  if form.css('display') == 'none'
    form.slideDown 'slow'
  else
    form.slideUp 'slow'

a.click ->
  toggleForm $("#<%= comments_form_id params[:reply_to] %>")

toggleForm form
