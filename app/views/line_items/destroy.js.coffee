if <%= @cart.total_items %> == 0
  $('#cart').slideUp('slow')
else
  $('#cart').html '<%= j(render @cart) %>'
