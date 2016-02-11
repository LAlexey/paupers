class App
  show_spinner: ->
    $('.loader-popup').show()

  hide_spinner: ->
    $('.loader-popup').hide()

window.app = new App
