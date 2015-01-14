#= require plugins/noty/noty

window.notify_user = (message) ->
  noty
    text: message,
    theme: 'bootstrapTheme',
    type: 'warning',
    animation: {
      open: 'animated tada', # or Animate.css class names like: 'animated bounceInLeft'
      close: 'animated bounceOutLeft', # or Animate.css class names like: 'animated bounceOutLeft'
      easing: 'tada',
      speed: 500 # opening & closing animation speed
    }
