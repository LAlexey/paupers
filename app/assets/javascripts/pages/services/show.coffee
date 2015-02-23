$ ->
  if ymaps?
    ymaps.ready ->
      $container = $('#map')
      long = $container.data('long')
      lat  = $container.data('lat')

      coordinates = [parseFloat(lat), parseFloat(long)]
      currentMap = new ymaps.Map("map", {
        center: coordinates,
        zoom: 12
      });

      currentMap.geoObjects.add(new ymaps.Placemark(coordinates, { iconContent: $container.data('address') }, {
        preset: "islands#redStretchyIcon"
      }))
