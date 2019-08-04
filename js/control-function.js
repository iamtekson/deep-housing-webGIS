// nav-web functional
$('.nav-web .options').click(function(){
   $('.option-content').toggle(); 
});

//Zoom in Zoom out function
$('.zoom-in').click(function(){
   map.setZoom(map.getZoom()+1)
});
$('.zoom-out').click(function(){
   map.setZoom(map.getZoom()-1)
});

