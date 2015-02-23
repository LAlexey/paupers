currentMap = null

getYandexCoordinates = (address, callback) ->
  ymaps.geocode(address, {json: true}).then (
    (res)->
        coordinates_string = res.GeoObjectCollection.featureMember[0].GeoObject.Point.pos
        coordinates = coordinates_string.split(' ').reverse()
        callback(coordinates)
    ),
    (
      (err)->
        alert(err)
    )
#  $.get "//geocode-maps.yandex.ru/1.x/?geocode=#{address}&format=json", (data)->
#    coordinates_string = data.response.GeoObjectCollection.featureMember[0].GeoObject.Point.pos
#    coordinates = coordinates_string.split(' ').reverse()
#    callback(coordinates)

centerYandexMap = (address) ->
  getYandexCoordinates address, (coordinates)->
    currentMap.setCenter(coordinates)

addNewPointByAddress = (e, data) ->
  fields = $(this).closest('.fields')

  city = fields.find('select :selected').text()

  address = fields.find('input')[0].value

  getYandexCoordinates "#{city} #{address}", (coordinates)->
    #TODO check points existing
#    currentMap.geoObjects._ps._BF


    currentMap.geoObjects.add(new ymaps.Placemark(coordinates, { iconContent: address }, {
      preset: "islands#redStretchyIcon"
    }))
    centerYandexMap(coordinates)


refresh_bindings = ->
  city_selects = $('select[role="city_select"]')

  city_selects.off 'change'
  city_selects.on 'change', (e)->
    name = $(this).find(':selected').text()
    centerYandexMap(name)

  ya_fields = $('button[role="geo_yandex"]')
  ya_fields.off 'click'
  ya_fields.on 'click', addNewPointByAddress

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

$ ->
  if ymaps?
    ymaps.ready(initYandexMap);
