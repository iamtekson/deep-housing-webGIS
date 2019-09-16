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

// default popup features
function popupContents(e){
    $('#sidebar-layer-control').slideDown();
    $('.sidebar-header h5').html('<h5>Information about the feature</h5>');
    $('.sidebar-layer-control-main-body').hide();
    $('.lat').show().html('<b>Latitude : </b>'+ e.latlng.lat);
    $('.long').show().html('<b>longitude : </b>' + e.latlng.lng);
    $('.sidebar-info').show();
    $('#sidebar-layer-control .btn-info').show();
}

//Street light control
var s_light_style = {
    radius: 8,
    fillColor: "#ff7800",
    color: "#000",
    weight: 1,
    opacity: 1,
    fillOpacity: 0.8
};

var light1 = L.geoJSON(street, {
    onEachFeature: function (feature, layer) {
        // var popupContent = '<h4 class = "text-primary">Street Light</h4>' +
        //     '<div class="container"><table class="table table-striped">' +
        //     '<thead><tr><th>Properties</th><th>Value</th></tr></thead>' +
        //     '<tbody><tr><td> Name </td><td>' + feature.properties.Name + '</td></tr>' +
        //     '<tr><td>Elevation </td><td>' + feature.properties.ele + '</td></tr>' +
        //     '<tr><td> Power (watt) </td><td>' + feature.properties.Power_Watt + '</td></tr>' +
        //     '<tr><td> Pole Height </td><td>' + feature.properties.pole_hgt + '</td></tr>' +
        //     '<tr><td> Time </td><td>' + feature.properties.time + '</td></tr>';
        // layer.bindPopup(popupContent),
        layer.on({
            click: function(e) {
                popupContents(e);
                $('.sidebar-info').html('<h4 class = "text-primary">Street Light</h4>' +
                '<div class="container"><table class="table table-striped">' +
                '<thead><tr><th>Properties</th><th>Value</th></tr></thead>' +
                '<tbody><tr><td> Name </td><td>' + feature.properties.Name + '</td></tr>' +
                '<tr><td>Elevation </td><td>' + feature.properties.ele + '</td></tr>' +
                '<tr><td> Power (watt) </td><td>' + feature.properties.Power_Watt + '</td></tr>' +
                '<tr><td> Pole Height </td><td>' + feature.properties.pole_hgt + '</td></tr>' +
                '<tr><td> Time </td><td>' + feature.properties.time + '</td></tr>');
                
            }
        }); 
    },
    pointToLayer: function (feature, latlng) {
        return L.circleMarker(latlng, s_light_style);
    }
});

var light = L.markerClusterGroup().addLayer(light1);


