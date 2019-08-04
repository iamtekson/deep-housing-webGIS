// var map declear
var map = L.map('map', {
    zoomControl: false
}).setView([28.2521, 83.9774], 18);
var scale = L.control.scale().addTo(map); //scale contorl of the map

// base layer (tilelayer as a variable)
var osm = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
}).addTo(map);

var topo = L.tileLayer('https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
    attribution: 'Map data: &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, <a href="http://viewfinderpanoramas.org">SRTM</a> | Map style: &copy; <a href="https://opentopomap.org">OpenTopoMap</a> (<a href="https://creativecommons.org/licenses/by-sa/3.0/">CC-BY-SA</a>)'
});

var watercolor = L.tileLayer('https://stamen-tiles-{s}.a.ssl.fastly.net/watercolor/{z}/{x}/{y}.{ext}', {
    attribution: 'Map tiles by <a href="http://stamen.com">Stamen Design</a>, <a href="http://creativecommons.org/licenses/by/3.0">CC BY 3.0</a> &mdash; Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
    subdomains: 'abcd',
    minZoom: 1,
    maxZoom: 19,
    ext: 'jpg'
});

var CartoDB = L.tileLayer('https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png', {
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors &copy; <a href="https://carto.com/attributions">CARTO</a>',
    subdomains: 'abcd',
    maxZoom: 19
});

var mapBox = L.tileLayer('https://api.tiles.mapbox.com/styles/v1/{username}/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}', {
    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
    username: 'iamtekson',
    id: 'cjwhym7s70tae1co8zf17a3r5',
    accessToken: 'pk.eyJ1IjoiaWFtdGVrc29uIiwiYSI6ImNqdjV4YzI4YjB0aXk0ZHBtNnVnNWxlM20ifQ.FjQJyCTodXASYtOK8IrLQA'
});

var baselayer = {
    "Open Street Map": osm,
    "Open Topo Map": topo,
    "Water Color": watercolor,
    "CartoDB map": CartoDB,
    "Custom Mapbox": mapBox
}
var layerControl = L.control.layers(baselayer, null, {
    collapsed: false
}).addTo(map);

// OSM layer geocoding
var searchLayer = L.Control.geocoder().addTo(map);
$('.leaflet-control-geocoder-icon').replaceWith('<i class="fas fa-search"></i>');
$('.leaflet-control-geocoder .fas').css({
    'margin': '0 !important',
    'font-size': '1.2rem',
    'padding': '15px',
    'background-color': '#087aa3',
    'color': '#ffffff',
});

//Leaflet map print
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
