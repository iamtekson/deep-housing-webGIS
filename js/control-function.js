// nav-web functional
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

