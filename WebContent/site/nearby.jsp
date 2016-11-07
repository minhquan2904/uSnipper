<%@ page pageEncoding="utf-8"%>
<jsp:include page="Layout/_header.jsp"/>
  <div class="container-fluid">
    <input type="text" id="address" />
  <!--   <button id="search">Tìm kiếm</button> -->

    <div id="googleMap" style="width: 1000px; height: 500px;">Google Map</div>
  </div>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBwTYGP_-vrJ6AAmCuYPY8mFRso4jfCUsQ&v=3.exp&sensor=true&libraries=places"></script>

<script>

    var placeKeyword;
    var myLatLng = new google.maps.LatLng(10.849301, 106.773904);

    function initialize()
    {

      var mapOptions = {
        center : myLatLng,
        zoom: 16,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      }
      var map = new google.maps.Map(document.getElementById("googleMap"),mapOptions);

      var marker = new google.maps.Marker({
        position : myLatLng,
        map : map
      });
      var addressInput = $("#address")[0];
      var addressAutocomplete = new google.maps.places.Autocomplete(addressInput);
      addressAutocomplete.bindTo("bounds",map);
      google.maps.event.addListener(addressAutocomplete,"place_changed",function(){
          var placeObj = addressAutocomplete.getPlace();
          marker.setPosition(placeObj.geometry.location);
          map.setCenter(placeObj.geometry.location)
      });
    }
      google.maps.event.addDomListener(window, 'load', initialize);
</script>
<jsp:include page="Layout/_footer.jsp"/>
