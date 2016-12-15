<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>

<%@ page pageEncoding="utf-8"%>
<jsp:include page="Layout/_header.jsp"/>
	<script type="text/javascript">
  	var newlocation = [];
  	var myContent = [];
  	var myId = [];
	</script>
  <div class ="myRow">
  	
  	<div class="col-lg-6" style="margin-left:200px;">	
  		 <label>Nhập vị trí của bạn</label>
  		 <br/>
  		 <input class="form-control" type="text" id="address" placeholder="Nhập vị trí của bạn" style="margin-top:10px;margin-bottom:10px"/>
  		 <input type="text" id="inputLat" hidden="hidden">
  		 <input type="text" id="inputLng" hidden="hidden">
  		
  		 <div id="googleMap" style="width: 800px; height: 300px; position: fixed;">Google Map</div>
  		  <button type="button" class="btn btn-success" disabled="disabled" id="find">Tìm kiếm</button>
  		 <script type="text/javascript">
  		 	$("#find").click(function(){
  		 		var lat = $("#inputLat").val();
  		 		var lng = $("#inputLng").val();
  		 		window.location.href="nearby.html?lat="+lat+"&lng="+lng+""
  		 	});
  		 </script>
  	</div>
  	
  	
  	
   	
   	</div>
 
  
 		
		
  </div> 
<script type="text/javascript">
var lat = 1;
var lng = 1;
var myLatLng = new google.maps.LatLng(10.849301, 106.773904);
var map;
var x = window.location;
var url = x;
var markers = [];
function initialize()
{
	
  var mapOptions = {
    center : myLatLng,
    zoom: 16,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }
  if(lat ==1)
  {
  	map = new google.maps.Map(document.getElementById("googleMap"),mapOptions);   
  }  
  var image = "http://2.pik.vn/2016d1c7ab21-652e-435a-a193-358eaafc1f50.png";
	  var infoWindow = new google.maps.InfoWindow({
      content : "Vị trí của bạn"
    });
	  var myLatLng1 = new google.maps.LatLng(lat,lng);
	 var marker = new google.maps.Marker({
	 position : myLatLng1,
	 map : map,
	 icon: image
	});
  var addressInput = $("#address")[0];
  var addressAutocomplete = new google.maps.places.Autocomplete(addressInput);
  addressAutocomplete.bindTo("bounds",map);
  google.maps.event.addListener(addressAutocomplete,"place_changed",function(){
      var placeObj = addressAutocomplete.getPlace();
      marker.setPosition(placeObj.geometry.location);
      map.setCenter(placeObj.geometry.location)
      var newLat = marker.getPosition().lat();
      var newLng = marker.getPosition().lng();
    	$("#inputLat").val(newLat);
    	$("#inputLng").val(newLng);
    	$("#find").removeAttr("disabled");
  });
  google.maps.event.addListener(marker, 'click', function(){
      
      map.setCenter(marker.getPosition());
      infoWindow.open(map,marker);
      
    });
 
 
   
}
google.maps.event.addDomListener(window, 'load', initialize);
</script>
<jsp:include page="Layout/_footer.jsp"/>