$(document).bind "mobileinit", ->
  $.extend $.mobile,
    transitionFallbacks:
      slide: 'slide'
      pop: 'pop'
