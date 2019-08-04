// nav-web function toggle
$('.nav-web .options').click(function () {
   $('.option-content').toggle();
});

//Zoom in Zoom out function
$('.zoom-in').click(function () {
   map.setZoom(map.getZoom() + 1)
});
$('.zoom-out').click(function () {
   map.setZoom(map.getZoom() - 1)
});

//Toggle full layer
function fullScreenTgl() {
   let doc = document, elm = doc.documentElement;
   if (elm.requestFullscreen) { (!doc.fullscreenElement ? elm.requestFullscreen() : doc.exitFullscreen()) }
   else if (elm.mozRequestFullScreen) { (!doc.mozFullScreen ? elm.mozRequestFullScreen() : doc.mozCancelFullScreen()) }
   else if (elm.msRequestFullscreen) { (!doc.msFullscreenElement ? elm.msRequestFullscreen() : doc.msExitFullscreen()) }
   else if (elm.webkitRequestFullscreen) { (!doc.webkitIsFullscreen ? elm.webkitRequestFullscreen() : doc.webkitCancelFullscreen()) }
   else { console.log("Fullscreen support not detected."); }
}
$('.full-browser').click(fullScreenTgl); //View in full screen toggler




//Zoom to layer
$('.extend').click(function () {
   map.setView([28.2521, 83.9774], 18);
});



//Marker add function
$('.marker-add').click(function () {
   map.on('click', function (e) {
      var popup = `<b>Lat: ${e.latlng.lat}</b> </br> <b> Lng: ${e.latlng.lng}</b>`,
      marker = new L.Marker([e.latlng.lat, e.latlng.lng]),
      m = marker.bindPopup(popup).openPopup().addTo(map);
   })
});

//Jquery-UI dialogbox
$('.add-vector-layer').dialog();