window.init_sortable = ->
  if $('#sortable').length > 0
#    table_width = $('#sortable').width()
#    cells = $('.table').find('tr')[0].cells.length
#    desired_width = table_width / cells + 'px'
#    $('.table td').css('width', desired_width)

    $('#sortable').sortable(
      axis: 'y'
      items: '.item'
      cursor: 'move'

      sort: (e, ui) ->
        ui.item.addClass('active-item-shadow')
      stop: (e, ui) ->
        ui.item.removeClass('active-item-shadow')
        # highlight the row on drop to indicate an update
        ui.item.children('td').effect('highlight', {}, 1000)
      update: (e, ui) ->
        item_id = ui.item.data('item-id')
        console.log(item_id)
        position = ui.item.index() # this will not work with paginated items, as the index is zero on every page
        $.ajax(
          type: 'PUT'
          url: '/admin/file_upload/update_position'
          dataType: 'json'
          data: { item: { klass: 'ServiceImage', id: item_id, position: position } }
        )
    )

window.refresh_sortable = ->
  $('#sortable').trigger('refresh')

$ ->
  $('.init_sortable').click (e)->
    e.preventDefault();
    e.stopPropagation();
    window.init_sortable();

