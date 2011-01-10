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
      clickEventListener.enable();
    });

    // Load from balloon anchor
    var mlBalloonListener = YMaps.Events.observe(map, map.Events.BalloonOpen, function(pMap) {
      var balloon = pMap.getBalloon();
      var link = $(balloon._container).find('a')[0];
      $(link).click(function() {
        Ecomap.loadFromAnchor($(this).attr('href'));
      });
    });

    $('.load-points').click(function(eventObject) {
      // Load YMapsML
      var yMapsMlUrl = this.getAttribute('data-ymaps_ml_url');
      if (yMapsMlUrl) {
        var ml = new YMaps.YMapsML(yMapsMlUrl);
        var mlFaultEventListener = YMaps.Events.observe(ml, ml.Events.Fault, function(pMl, error) {
          alert("Error on load YMapsML: "+error);
        });
        var mlLoadEventListener = YMaps.Events.observe(ml, ml.Events.Load, function(pMl) {
          map.addOverlay(ml);
        });
      }
      else {
        alert("Can't find YMapsML URL");
      }
      return false;
    });
});

