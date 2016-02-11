#= require plugins/noty/noty

window.notify_user = (message) ->
  noty
    text: message,
    theme: 'bootstrapTheme',
    type: 'warning',
    animation: {
      open: 'animated tada',
      close: 'animated bounceOutLeft',
      easing: 'tada',
      speed: 500
    }

$ ->
  $dt = $('@datepicker')
  if $dt.length
    $dt.datetimepicker
      format:	'd.m.Y'
      timepicker: false
      closeOnDateSelect: true

  $('@async-file-upload').change ->
    $this = $(this)
    form = $this.closest('form')
    fd = new FormData(form[0])

    app.show_spinner()

    file = this.files[0]

#    reader = new FileReader()
#    reader.onload = (e)->
#      $('.profile-image').html("<img width=\"200\" src=\"#{e.target.result}\">")
#    reader.readAsDataURL(file)

    img = document.createElement("img")
    img.src = window.URL.createObjectURL(file);
    img.width = 200;
#    img.onload = ->
#      window.URL.revokeObjectURL(this.src)
#      app.hide_spinner()

    $('.profile-image').html(img)


#    $.ajax
#      url: form.attr('action')
#      type: "POST"
#      data: fd
#      processData: false
#      contentType: false
#      success: (data, status, xhr) ->
#        $('.profile-image').html("<img src=\"#{data.profile_image}\">")
#
#      complete: ->
#        app.hide_spinner()
