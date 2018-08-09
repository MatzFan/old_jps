function drawAppsMap() {
  var center_initial = {lat: 49.210, lng: -2.135}; // Digimap center
  map = new google.maps.Map(document.getElementById('mapDiv'), {
    zoom: 13,
    center: center_initial,
    mapTypeId: 'satellite'
  });
}
