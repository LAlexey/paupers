#= require jquery
#= require jquery_ujs
#= require jquery-ui
#= require jquery.cookie

#= require bootstrap-sprockets
#= require plugins/role

#= require jquery.ui.nestedSortable
#= require sortable_tree/initializer
#= require sortable_table

#= require utils
#= require app

#= require plugins/bootstrap-rating/bootstrap-rating
#= require plugins/datetimepicker/jquery.datetimepicker
#= require fotorama.js
#= require pages/services/show

#= require dropzone
#= require react
#= require_self

class App
  constructor: () ->
    console.log('app defined')
  token: ->
    @_token ||= $("meta[name=csrf-token]").attr('content')

window.app = new App()
