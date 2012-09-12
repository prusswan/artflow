# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $('#comments li').slice(3).hide()

  $('#comment_expander').click (e) ->
    comments = $('#comments li')
    if $(this).text() == 'View All Comments'
      comments.show()
      $(this).text('Collapse Comments')
    else
      comments.slice(3).hide()
      $(this).text('View All Comments')
    e.preventDefault()
