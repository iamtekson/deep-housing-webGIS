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
$('.sidebar-close').click(function () {
   $('.lat').hide();
   $('.long').hide();
   $('.sidebar-info').hide();
   $('.addsidebar-popup').hide();
   $('#sidebar-layer-control').hide();
});
//Go back to options
function goBackToOptions (){
   $(this).hide();
   $('.lat').hide();
   $('.long').hide();
   $('.sidebar-info').hide();
   $('.addsidebar-popup').hide();
   console.log('clicked go back to functions');
   $('#sidebar-layer-control').show();
   $('.sidebar-header h5').html('Options');
   $('.sidebar-layer-control-main-body').show();
};

$('.go-back-to-options').click(goBackToOptions);
//layer-toggler
$('.layer-toggler .fa-layer-group').click(function(){
   $('.sidebar-header h5').html('Options');
   $('.sidebar-layer-control-main-body').show();
   $('#sidebar-layer-control').toggle();
});


//how to use button function : side option
$('.sidebar-layer-control-main-body .tutorial').click(tutorial);

//add default baselayer : side option
$('.sidebar-layer-control-main-body .add-default-baselayer').click(defaultLyr);

//remove all baselayer : side option
$('.sidebar-layer-control-main-body .remove-all-baselayer').click(clearAllLayer);

//add default layers : side option 
$('.sidebar-layer-control-main-body .add-default-layer').click(clearAllLayer);

//remove all layers : side option
$('.sidebar-layer-control-main-body .remove-all-layer').click(clearAllLayer);

//basemap layer control : side layer
function defaultLyr(){
   $('.osm').prop('checked', true);
   osm.addTo(map);
   mapBox.remove()
   watercolor.remove()
   CartoDB.remove()
}
function clearAllLayer(){
   $('.osm').prop('checked', false);
   $('.dark').prop('checked', false);
   $('.water').prop('checked', false);
   $('.mapbox').prop('checked', false);
   mapBox.remove()
   watercolor.remove()
   CartoDB.remove()
   osm.remove()
}

$(".osm").click(defaultLyr);
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
      return $('.latlng').html(`Lat : ${e.latlng.lat}, Long: ${e.latlng.lng}`)
   });
   setTimeout(latlng, 1000);
}
latlng();

//Tutorial of this web-gis : introjs
$('.option-content .tutorial').click(tutorial);
function tutorial(){
var intro = introJs();
   intro.setOptions({
      steps: [
         {
            intro: "<h1>Tutorial</h1>"
         },
         {
            element: document.querySelector('.nav-web'),
            intro: "<h1>Nav bar</h1><ol><li>Options</li><ul><li>Map printout</li><li>Add vector layers</li><li>Measure function</li><li>Other many more actions</li></ul><li>User login</li><li>Home button</li></ol>."
         },
         {
            element: '.leaflet-control-geocoder',
            intro:'<h1>search</h1><p>The places names can be searched from here.</p>'
         },
         {
            element: document.querySelector('.side-control'),
            intro: "<h1> basic functionalities </h1><ul><li>Zoom in</li><li>Zoom out</li><li>Zoom to layer</li><li>Full browser</li><li>3D layer</li><li>Info about feature</li><li>Add marker</li</ul>",
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
            element:'.layer-toggler',
            intro: "<h1>Layer Group</h1><p>The selected layer from this menu will be displayed in map"
         },
         {
            element: '#sidebar-layer-control',
            intro: '<h1>sidebar layer control</h1> <ul><li>Select one baselayer</li><li>select requred layers</li></ul>'
         }
      ]
   });
   intro.start();
}
