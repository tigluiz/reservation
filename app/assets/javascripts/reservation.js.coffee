# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.send_data').click (event)->
    reservation_info = $(this).data()
    $.ajax(
      "/room_booking/create"
      type: 'POST'
      data: reservation_info
      success: (data, textStatus, jqXHR) ->
        alert("YEE")
    )
    event.preventDefault()
