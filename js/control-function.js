// =================================================
// Plugin Functionality
// =================================================

// OSM layer geocoding : leaflet-search
var searchLayer = L.Control.geocoder().addTo(map);
$('.leaflet-control-geocoder-icon').replaceWith('<i class="fas fa-search"></i>');
$('.leaflet-control-geocoder .fas').css({
   'margin': '0 !important',
   'font-size': '1.2rem',
   'padding': '15px',
   'background-color': '#087aa3',
   'color': '#ffffff',
});

//Leaflet map print : leaflet-browser-print
L.control.browserPrint({
   title: 'Print current Layer',
   documentTitle: 'Utility Management System',
   printModes: [
      L.control.browserPrint.mode.landscape("Tabloid VIEW", "Tabloid"),
      L.control.browserPrint.mode.landscape(),
      "PORTrait",
      L.control.browserPrint.mode.auto("Auto", "B4"),
      L.control.browserPrint.mode.custom("Selected area", "B5")
   ],
   manualMode: false,
   closePopupsOnPrint: true, //default value
}).addTo(map);
$('.print').click(function () {
   $('.option-content').hide();
   var modeToUse = L.control.browserPrint.mode.landscape();
   map.printControl.print(modeToUse);
});

//Add vector layer function : leaflet-omnivore
$('.addVectorLayer_btn').click(function () {
   //Jquery-UI dialogbox
   $('.add-vector-layer').dialog({
      width: 400
   });
});
map.on('click', function () {
   $('.add-vector-layer').hide();
});
var fileInput = document.getElementById('input_files');
function geojsonData() {
   fileInput.addEventListener('change', function (event) {
      var file = fileInput.files[0],
         fr = new FileReader();
      fileInput.value = ''; // Clear the input.
      fr.onload = function () {
         console.log(fr.result);
         var layer = omnivore.geojson(fr.result).addTo(map); // Executed synchronously, so no need to use the .on('ready') listener.
         map.fitBounds(layer.getBounds());
      };
      fr.readAsDataURL(file);
   });
};
function csvData() {
   fileInput.addEventListener('change', function (event) {
      var file = fileInput.files[0],
         fr = new FileReader();
      fileInput.value = ''; // Clear the input.
      fr.onload = function () {
         console.log(fr.result);
         var layer = omnivore.csv.parse(fr.result).addTo(map); // Executed synchronously, so no need to use the .on('ready') listener.
         map.fitBounds(layer.getBounds());
      };
      fr.readAsText(file);
   });
};
//   $(fileInput).change(function(e){
//     var fileName = e.target.files[0].name;
//     console.log(fileName);
//     if(fileName.endsWith("csv")) {
//         csvData();
//     } else {
//         geojsonData();
//     }
// });
geojsonData();
// omnivore.csv('a.csv').addTo(map);
// omnivore.gpx('a.gpx').addTo(map);
// omnivore.kml('a.kml').addTo(map);
// omnivore.wkt('a.wkt').addTo(map);
// omnivore.topojson('a.topojson').addTo(map);
// omnivore.geojson('data/try.geojson').addTo(map);
// omnivore.polyline('a.txt').addTo(map);


// Measure distance and area : leaflet-measure
$(".measure-btn").click(function () {
   $(".leaflet-control-measure").toggle();
   $('.leaflet-control-measure-interaction').show();
   $('.leaflet-control-measure-toggle').hide();
});
$('.js-cancel').click(function () {
   $(".leaflet-control-measure").hide();
});
$('.js-finish').click(function () {
   $(".leaflet-control-measure").hide();
});

var measureControlOption = {
   primaryLengthUnit: 'meters',
   secondaryLengthUnit: 'kilometers',
   primaryAreaUnit: 'sqmeters',
   secondaryAreaUnit: undefined,
   activeColor: '#ed3833',
   completedColor: '#63aabc',
}
var measureControl = L.control.measure(measureControlOption);
measureControl.addTo(map);


// ==========================================
// Other control Functions
// ==========================================

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

//show coordinate in footer
function latlng() {
   map.on('mousemove', function (e) {
       return $('.latlng').html(`Lat : ${e.latlng.lat}, long: ${e.latlng.lng}`)
   });
   setTimeout(latlng, 1000);
}
latlng();