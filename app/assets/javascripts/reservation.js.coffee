# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.send_data').click (event)->
    reservation_info = $(this).data()
    window.link_selected = $(this)
    if $(this).text() == "Disponível"
      $.ajax(
        "/room_booking/create"
        type: 'POST'
        data: reservation_info
        success: (data, textStatus, jqXHR) ->
          link_selected.html("Cancelar")
          link_selected.attr("href", "/room_booking/destroy")
          link_selected.parent().find('span').html('Reservado por ' + jqXHR.responseJSON.user)
      )
    else
      $.ajax(
        "/room_booking/destroy"
        type: 'POST'
        data: reservation_info
        success: (data, textStatus, jqXHR) ->
          link_selected.html("Disponível")
          link_selected.attr("href", "/room_booking/create")
          link_selected.parent().find('span').html('')
      )
    event.preventDefault()

