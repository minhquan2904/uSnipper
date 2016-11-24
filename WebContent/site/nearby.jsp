<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>

<%@ page pageEncoding="utf-8"%>
<jsp:include page="Layout/_header.jsp"/>

  <p id="demo"></p>
  <button type="button" class="btn btn-default" id="btndemo">
      Lấy vị trí
    </button>
  <div class="container-fluid">
    <div id="googleMap" style="width: 1000px; height: 500px;">Google Map</div>
  </div>
  	<script type="text/javascript">
  	var newlocation = [];
	</script>
 
		<c:forEach var="i" items="${list}" varStatus="loop">
		  	
		    <div class="rts-item" style="height:220px;"><!-- RTS Item -->
		   	 <div class="col-lg-6">
		  			<a href="viewrts.html?id=${i.id}"><img src="images/${i.hinhAnh}" alt="" class="img-item" /></a> 
		  		 </div>
		    	<div class="col-lg-6">
		    		<div class= "img-info" style="text-align: left;">
		    			<div class="rname">
		    				<b>${i.tenQuanAn}</b> <br>
		    			</div>
		         <address class="address-rts">
		           <i><span class="number">${i.soNha}</span> -
		           <span class="street">${i.tenDuong }</span> -
		           <span class="town">${i.tenPhuong }</span> -
		           <span class="dist">${i.tenQuan}
		           Thành phố Hồ Chí Minh</span></i>
		         </address>
		         <script type="text/javascript" >
		         	     var lat${loop.index} = ${i.lat};
		         	     var lng${loop.index} = ${i.lng};
		         	     var newlocation${loop.index} = new google.maps.LatLng( lat${loop.index},lng${loop.index});
		         	     newlocation.push(newlocation${loop.index});
		         </script>
		         <div class="rfamous">
		         	<b>Món nổi tiếng: ${i.monNoiTieng }</b>
		         </div>
		         <div class="rdate">
		         	<label for="date" style="margin-right:15px;">Ngày thêm</label>
		         	<input type="date" disabled="disabled" value="${i.ngayThem}">
		         </div>
		        	
		    		</div>              	 	
		   </div>	
		     
		   </div><!-- /RTS Item -->
		  </c:forEach>
		
	
	
  


<script>

    var placeKeyword;
    var x = document.getElementById("demo");
    var lat =0;
    var lng = 0;
    var myLatLng = new google.maps.LatLng(10.849301, 106.773904);
    var map;
    
    var markers = [];
   
    function initialize()
    {
		
      var mapOptions = {
        center : myLatLng,
        zoom: 16,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      }
      
      if(${lat} != null && ${lng}!=null)
	  {
	  	  var lat =${lat};
	  	  var lng = ${lng};
	  	  var image = "images/"
	  	  var infoWindow = new google.maps.InfoWindow({
	          content : "Vị trí của bạn"
	        });
		  var myLatLng1 = new google.maps.LatLng(lat,lng);
          var marker1 = new google.maps.Marker({
          position : myLatLng1,
          map : map,
          
        });
      var myOptions = {
    	        center : myLatLng1,
    	        zoom: 16,
    	        mapTypeId: google.maps.MapTypeId.ROADMAP
    	      }
      
      map = new google.maps.Map(document.getElementById("googleMap"),myOptions);   
      
      marker1.setMap(map);
      for (var i = 0; i < newlocation.length; i++) {
    	  
		  var marker = new google.maps.Marker({
          position: newlocation[i],
          map: map
      });
     
  		}
	  }
      else
    	  map = new google.maps.Map(document.getElementById("googleMap"),mapOptions);   
      
     
     
    }
    google.maps.event.addDomListener(window, 'load', initialize);
   
	function process(data){
    	  
      }
   	function getLocation() {
          if (navigator.geolocation) {
              navigator.geolocation.getCurrentPosition(showPosition);
          } else {
              x.innerHTML = "Geolocation is not supported by this browser.";
          }
      }
      function showPosition(position) {
    	  lat = position.coords.latitude;
    	  lng = position.coords.longitude;
          x.innerHTML = "Latitude: " + lat +"Longitude: " + lng;       
          window.location.href=window.location + '?lat='+lat+'&lng='+lng;
      }
      $("#btndemo").click(function(){
        getLocation();
        var dt = {
          		'lat':lat,
          		'lng':lng
          };
          console.log(dt);
      })   ;
      function setAllMap(map) {
          for (var i = 0; i < markers.length; i++) {
              markers[i].setMap(map);
          }
      }

      
      $(document).ready(function(){
    	 
    	
      });
</script>
<jsp:include page="Layout/_footer.jsp"/>
