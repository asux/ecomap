window.Ecomap = {
  objectName: "sample",
  mapContainer: null,
  map: null,
  centerLng: null,
  centerLat: null,
  defaultScale: 0,
  alert: function (message) {
    alert("[Ecomap] "+message.toString());
  },
  initYMap: function(YMaps, mapContainer) {
    map = new YMaps.Map(mapContainer);
    Ecomap.mapContainer = mapContainer;
    Ecomap.map = map;

    // Sets default parameters of map rendering: center and scale coeficient
    Ecomap.centerLat = mapContainer.getAttribute("data-center_lat");
    Ecomap.centerLng = mapContainer.getAttribute("data-center_lng");
    Ecomap.defaultScale = mapContainer.getAttribute("data-default_scale");
    if (Ecomap.centerLat && Ecomap.centerLng && Ecomap.defaultScale) {
      var center =new YMaps.GeoPoint(Ecomap.centerLng, Ecomap.centerLat);
      var zoom = Ecomap.defaultScale;
    } else if (YMaps.location) {
      var center = new YMaps.GeoPoint(YMaps.location.longitude, YMaps.location.latitude);
      if (YMaps.location.zoom) {
        var zoom = YMaps.location.zoom;
      }
    }
    map.setCenter(center, zoom);

    //map.enableScrollZoom();
    map.addControl(new YMaps.ToolBar());
    map.addControl(new YMaps.TypeControl());
    map.addControl(new YMaps.Zoom());
    //map.addControl(new YMaps.MiniMap());
    map.addControl(new YMaps.ScaleLine());

    // Configure toolbar
    //
    // var toolbar = new YMaps.ToolBar();
    //
    // Creates button
    // var button = new YMaps.ToolBarButton({
    //   caption: "Add placemark",
    //   hint: "Add placemark to center of map"
    // });

    // При щелчке по кнопке включается линейка
    // YMaps.Events.observe(button, button.Events.Click, function () {
    //   map.addOverlay(new YMaps.Placemark(map.getCenter(), {draggable: true}));
    // }, map);

    // toolbar.add(button);
    // map.addControl(toolbar);

    //Search
    var searchControl = new YMaps.SearchControl({
      resultsPerPage: 5,  // Objects count on page
      useMapBounds: 1     // Objects found in visible area of map will be shown ahead of list
    });
    map.addControl(searchControl);
    return map;
  },
  updateCoordinates: function(point) {
    var objectName = Ecomap.objectName.toString();
    $('#'+objectName+'_lng').val(point.getLng());
    $('#'+objectName+'_lat').val(point.getLat());
  },
  addPlacemark: function(lng, lat) {
    return Ecomap.map.addOverlay(new YMaps.Placemark(new YMaps.GeoPoint(lng, lat)));
  },
  extractPathFromAnchorURL: function(url) {
    var regexp = /^#!(.*)$/ig;
    var m = regexp.exec(url);
    if (m) {
      var path = m[1];
      if(path) {
        return path.toString();
      }
    }
    return null;
  },
  loadFromAnchor: function(anchorURL) {
    var path = Ecomap.extractPathFromAnchorURL(anchorURL);
    if (path) {
      var newLink = $('<a>').attr('href', path).html("Sample: "+path);
      $('#path').append($('<li>').append(newLink));
    } else {
      Ecomap.alert("Can't find placemark path");
    }
  },
  loadYMapsML: function (url) {
    var ml = new YMaps.YMapsML(url);
    var mlFaultEventListener = YMaps.Events.observe(ml, ml.Events.Fault, function(pMl, error) {
      Ecomap.alert("Error on load YMapsML: "+error);
    });
    var mlLoadEventListener = YMaps.Events.observe(ml, ml.Events.Load, function(pMl) {
      Ecomap.map.addOverlay(ml);
    });
  }
}