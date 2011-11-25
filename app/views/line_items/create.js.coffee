$('#notice').css 'display', 'none'

html = $('<%= j(render @cart) %>')
isNewItem = $('#current_item .quantity', html).attr('data-quantity') == "1"
$('#current_item', html).css("display", "none") if isNewItem

$('#cart').html html
$('#cart').slideDown('slow') if <%= @cart.total_items %> == 1

$('#current_item').slideDown('slow') if isNewItem
for color in ['#8f8', '#141']
  $('#current_item').animate { backgroundColor: color }, 'slow'
