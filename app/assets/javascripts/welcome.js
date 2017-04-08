$(document).on('turbolinks:load', function(data){
  function success(position){
      var mylat = position.coords.latitude;
      var mylong = position.coords.longitude;
      console.log("lat = " + mylat)
      console.log("long = " + mylong)
      var coords = new google.maps.LatLng(mylat, mylong);
      var mapOptions = {
          zoom: 12,
          center: coords,
          mapTypeId: google.maps.MapTypeId.ROADMAP
      }
      var map = new google.maps.Map(document.getElementById("map"), mapOptions);
      var marker = new google.maps.Marker({map: map, position: coords});
          circle.bindTo('center', marker, 'position');
  }
  function failure(){
      $('body').append("<p>It didn't work, co-ordinates are not available!</p>")
  }
  x = navigator.geolocation;
  x.getCurrentPosition(success, failure);
});
