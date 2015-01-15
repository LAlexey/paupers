currentMap = null

getYandexCoordinates = (address, callback) ->
  $.get "//geocode-maps.yandex.ru/1.x/?geocode=#{address}&format=json", (data)->
    coordinates_string = data.response.GeoObjectCollection.featureMember[0].GeoObject.Point.pos
    coordinates = coordinates_string.split(' ').reverse()
    callback(coordinates)

centerYandexMap = (address) ->
  getYandexCoordinates address, (coordinates)->
    currentMap.setCenter(coordinates)

update_yandex_map = (e, data) ->
  city = $('#vendor_city_id').find(':selected').text()

  address = $(this).parent().siblings('input')[0].value
  getYandexCoordinates "#{city} #{address}", (coordinates)->

    currentMap.geoObjects.add(new ymaps.Placemark(coordinates, { iconContent: address }, {
      preset: "islands#redStretchyIcon"
    }))


refresh_bindings = ->
  ya_fields = $('button[role="geo_yandex"]')
  ya_fields.off 'click'
  ya_fields.on 'click', update_yandex_map


$(document).on "nested:fieldAdded", (event) ->
  field = event.field
  refresh_bindings()


initYandexMap = ->
  currentMap = new ymaps.Map("map", {
    center: [56.010569, 92.852545],
    zoom: 11
  });

#  $('form .fields input:text').each ->
#    coordinates = [$(this).data('lat'), $(this).data('long')]
#    currentMap.setCenter(coordinates)
#    currentMap.geoObjects.add(new ymaps.Placemark(coordinates, { iconContent: 'test' }, {
#      preset: "islands#redStretchyIcon"
#    }))

  refresh_bindings()

  $('#vendor_city_id').on 'change', (e)->
    name = $(this).find(':selected').text()
    centerYandexMap(name)


$ ->
  ymaps.ready(initYandexMap);
