function Ecomap() {
}

$.extend(Ecomap, {
  mapContainer: null,
  map: null,
  initYMap: function(YMaps, mapContainer) {
    this.mapContainer = mapContainer;
    this.map = new YMaps.Map(mapContainer);

    // Sets default parameters of map rendering: center and scale coeficient
    this.centerLng = 30.634439;
    this.centerLat = 50.39837;
    this.defaultZoom = 14;
    this.map.setCenter(new YMaps.GeoPoint(this.centerLng, this.centerLat), this.defaultZoom);
    //this.map.enableScrollZoom();
    this.map.addControl(new YMaps.ToolBar());
    this.map.addControl(new YMaps.TypeControl());
    this.map.addControl(new YMaps.Zoom());
    //this.map.addControl(new YMaps.MiniMap());
    this.map.addControl(new YMaps.ScaleLine());
    
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
    //   this.addOverlay(new YMaps.Placemark(this.map.getCenter(), {draggable: true}));
    // }, map);

    // toolbar.add(button);
    // this.map.addControl(toolbar);

    //Search
    var searchControl = new YMaps.SearchControl({
      resultsPerPage: 5,  // Objects count on page
      useMapBounds: 1     // Objects found in visible area of map will be shown ahead of list
    });
    this.map.addControl(searchControl);
    return this.map;
  },
  updateCoordinates: function(point) {
    $('#lng').val(point.getLng());
    $('#lat').val(point.getLat());
  },
  addPlacemark: function(map, lng, lat) {
    return map.addOverlay(new YMaps.Placemark(new YMaps.GeoPoint(lng, lat)));
  },
  extractPathFromAnchorURL: function(url) {
    var regexp = /^#!(.*)$/ig;
    var m = regexp.exec(url);
    console.debug(m);
    if (m) { 
      var path = m[1];
      if(path) {
        return path.toString();
      }
    }
    return null;
  },
  loadFromAnchor: function(anchorURL) {
    var path = this.extractPathFromAnchorURL(anchorURL);
    if (path) {
      var newLink = $('<a>').attr('href', path).html("Sample: "+path);
      $('#path').append($('<li>').append(newLink));
    } else {
      alert("Can't find placemark path");
    }
  }
});
