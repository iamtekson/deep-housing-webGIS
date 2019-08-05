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
function getDataFromInputFile() {
   fileInput.addEventListener('change', function (event) {
      var file = fileInput.files[0],
         fr = new FileReader();
      fileInput.value = ''; // Clear the input.
      extention = file.name.split('.')[1]
      console.log(extention)
      if (extention === 'geojson') {
         fr.onload = function () {
            console.log(file);
            var layer = omnivore.geojson(fr.result).addTo(map);
            map.fitBounds(layer.getBounds());
            // } else if () {

            // }
            console.log(extention)
         };
         fr.readAsDataURL(file);
      } else if (extention === 'csv') {
         fr.onload = function () {
            console.log(file);
            console.log(fr.result);
            console.log('i am here')
            var layer = omnivore.csv.parse(fr.result).addTo(map);
            map.fitBounds(layer.getBounds());
         };
         fr.readAsText(file);
      }
   });
};
getDataFromInputFile();

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

//Zoom to layer
$('.extend').click(function () {
   map.setView([28.2521, 83.9774], 18);
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

//Marker add function
var useMarker = true
$('.marker-add').click(function () {
   if (useMarker) {
      console.log('run')
      map.on('click', function (e) {
         var popup = `<b>Lat: ${e.latlng.lat}</b> </br> <b> Lng: ${e.latlng.lng}</b>`,
            marker = new L.Marker([e.latlng.lat, e.latlng.lng]),
            m = marker.bindPopup(popup).openPopup().addTo(map);
      })
   } else {
      map.off('click')
   }
   useMarker = !useMarker
});

// share map function
$('.share-btn').click(function () {
   $('.share').dialog({
      width: 400
   });
});

//about section in webmap
$('.about-btn').click(function () {
   $('.about-option').dialog({
      width: 500
   });
});


// ===================================
// sidebar-layrer and sidebar popup control
// ===================================

// sidebar-popup
map.on('click', function () {
   $('.addsidebar-popup').show()
});
$('.sidebar-close').click(function () {
   $('.addsidebar-popup').hide();
   $('#sidebar-layer-control').hide();
});

//layer-toggler
$('.layer-toggler .fa-layer-group').click(function(){
   $('#sidebar-layer-control').toggle();
});

//basemap layer control : side layer
$(".osm").click(function () {
   osm.addTo(map);
   mapBox.remove()
   watercolor.remove()
   CartoDB.remove()
});
$(".mapbox").click(function () {
   mapBox.addTo(map);
   watercolor.remove()
   osm.remove()
   CartoDB.remove()
});
$(".water").click(function () {
   watercolor.addTo(map);
   mapBox.remove()
   CartoDB.remove()
   osm.remove()
});
$(".dark").click(function () {
   CartoDB.addTo(map);
   watercolor.remove()
   osm.remove()
   mapBox.remove()
});

//sidebar-layer-control ::street light
$(".street-light").click(function () {
   if ($(this).prop('checked') == true) {
      map.addLayer(light);
   } else if ($(this).prop('checked') == false) {
      map.removeLayer(light);
   }
});

//layer control : street light
$(".street-light").click(function () {
   if ($(this).prop('checked') == true) {
      map.addLayer(light);
   } else if ($(this).prop('checked') == false) {
      map.removeLayer(light);
   }
});

//show coordinate in footer
function latlng() {
   map.on('mousemove', function (e) {
      return $('.latlng').html(`Lat : ${e.latlng.lat}, long: ${e.latlng.lng}`)
   });
   setTimeout(latlng, 1000);
}
latlng();

//Tutorial of this web-gis : introjs
$('.option-content .tutorial').click(function () {
   var intro = introJs();
   intro.setOptions({
      steps: [
         {
            intro: "<h1>Tutorial</h1>"
         },
         {
            element: document.querySelector('.nav-web'),
            intro: "<h1>Nav bar</h1><ol><li>Options</li><ul><li>map printout</li><li>add vector layers</li><li>measure function</li<li>other many more functions</li></ul><li>User login</li><li>Home button</li></ol>."
         },
         {
            element: document.querySelector('.side-control'),
            intro: "<h1> basic functionalities </h1><ul><li>Zoom in</li><li>Zoom out</li><li>Full browser</li><li>3D layer</li><li>Zoom to layer</li><li>Info about feature</li><li>Add marker</li</ul>",
            position: 'right'
         },
         {
            element: document.querySelector('.leaflet-control-scale'),
            intro: '<h1>Scale</h1> <p> This shows the map-scale in both unit meter and feet.</p>',
         },
         {
            element: '.coordinate',
            intro: "<h1>Coordinate</h1><p>This shows the coordinate of the mouse position while mouse is moving</p>",
         },
         {
            element: '#sidebar-layer-control',
            intro: '<h1>sidebar layer control</h1> <ul><li>select one baselayer</li><li>select requred layers</li></ul>'
         }
      ]
   });
   intro.start();
});
