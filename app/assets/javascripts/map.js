
var map;
var igreja = {lat: -23.5666636, lng: -46.5813633};
var festa = {lat: -23.5678914, lng: -46.5770047};

function initMap() {

  map = new google.maps.Map(document.getElementById('map'), {
    center: igreja,
    scrollwheel: false,
    draggable: false,
    zoom: 15
  });
  var directionsDisplay = new google.maps.DirectionsRenderer({
    map: map
  });

  // Set destination, origin and travel mode.
  var request = {
    destination: festa,
    origin: igreja,
    travelMode: google.maps.TravelMode.DRIVING
  };
  // Pass the directions request to the directions service.
  var directionsService = new google.maps.DirectionsService();
  directionsService.route(request, function(response, status) {
    if (status == google.maps.DirectionsStatus.OK) {
      // Display the route on the map.
      directionsDisplay.setDirections(response);
    }
  });
};

