# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#new_request').on 'ajax:success', ->
    $('#new_request_popup').modal('hide')
    $('#new_request').trigger('reset')

    window.notify_user('заявка отправлена!')
