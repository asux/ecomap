// On page load
$(function () {
    // Initialize map instance
    var map = Ecomap.initYMap(YMaps, $("#yandex-map")[0]);

    //Placemark
    var clickEventListener = YMaps.Events.observe(map, map.Events.Click, function (map, mEvent) {
      var point = mEvent.getGeoPoint();
      var myHtml = "Value: " + point + " with scale " + map.getZoom();
      map.openBalloon(point, myHtml);
      clickEventListener.disable();
      Ecomap.updateCoordinates(point);
    }, this);
    clickEventListener.disable();

    $('#set-coordinates').click(function(){
      var objectName = this.getAttribute('data-object_name');
      if(objectName) {
        Ecomap.objectName = objectName.toString();
        clickEventListener.enable();
        } else {
          Ecomap.alert("Can't determine objectName");
        }
    });

    // Load from balloon anchor
    var mlBalloonListener = YMaps.Events.observe(map, map.Events.BalloonOpen, function(pMap) {
      var balloon = pMap.getBalloon();
      var link = $(balloon._container).find('a')[0];
      $(link).click(function() {
        Ecomap.loadFromAnchor($(this).attr('href'));
      });
    });

    $('.load-placemarks').live('click', function(eventObject) {
      // Load YMapsML
      var url = this.getAttribute('data-ymapsml_url');
      if (url) {
        Ecomap.loadYMapsML(url);
      }
      else {
        Ecomap.alert("Can't find YMapsML URL");
      }
      return false;
    });

    $('.find-on-map').live('click', function(eventObject) {
      var lng = this.getAttribute('data-lng');
      var lat = this.getAttribute('data-lat');
      if (lng && lat) {
        Ecomap.findOnMap(lng, lat);
      } else {
        Ecomap.alert("Can't find coordinates");
      }
    });

    $('.load-data').live('click', function(eventObject) {
      Ecomap.loadFromAnchor($(this).attr('href'));
    });

    $('.load-placemarks').trigger('click');
});

