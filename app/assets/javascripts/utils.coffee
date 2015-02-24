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
  $('@datetimepicker').datetimepicker()
