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
  	<h4>Nếu vị trí không chính xác/thiết bị không hỗ trợ GPS hoặc muốn tìm kiếm ở địa điểm bạn mong muốn, Click <a href="get-location.html">vào đây</a> để nhập vị trí của bạn</h4>
  	
  	<div class="col-lg-6" >
  		
  		 <div id="googleMap" style="width: 600px; height: 500px; position: fixed;">Google Map</div>
  	</div>
  	<c:if test="${empty hasLct }">
  	<div class="col-lg-2" >
  			<button type="button" class="btn btn-default" id="btndemo" style="margin-bottom:10px;">
		      Tìm kiếm xung quanh bạn
		    </button>
		    <p>Chức năng tìm kiếm xung quanh chỉ hỗ trợ những thiết bị có hỗ trợ GPS nhé :)) . <br/>
		    	Nếu trình duyệt muốn biết địa chỉ của bạn thì bạn chấp thuận luôn nha. Cảm ơn các bạn.<br/>
		    	<i>--Admin--</i>
		    </p>
  	</div>
  	
    <div class="col-lg-2">
    	 <iframe src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2Fthongtindoanhoiute%2F&tabs=timeline&width=340&height=500&small_header=false&adapt_container_width=true&hide_cover=false&show_facepile=true&appId" width="300" height="400" style="border:none;overflow:hidden;" scrolling="no" frameborder="0" allowTransparency="true">
      </iframe>
    </div>
  	</c:if>
  	
  	<c:if test="${list.size() >2 }">
  	
    <div class="col-lg-4" style="padding-left:80px;">
    	 <iframe src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2Fthongtindoanhoiute%2F&tabs=timeline&width=340&height=500&small_header=false&adapt_container_width=true&hide_cover=false&show_facepile=true&appId" width="300" height="400" style="border:none;overflow:hidden;" scrolling="no" frameborder="0" allowTransparency="true">
      </iframe>
    </div>
  	<div class="col-lg-12">
			<div style="margin-right:50px;margin-top:15px;">
 			<c:forEach var="i" items="${list}" varStatus="loop">
		  
		    <div class="rts-item" style="height:220px;" id="${i.id}"><!-- RTS Item -->
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
		         	     var content = "<b>${i.tenQuanAn}</b>" + "<br/> Địa chỉ :" +  " ${i.soNha}" +"," + "${i.tenDuong }" + "," + "${i.tenPhuong }";
		         	     var id = ${i.id};
		         	     var newlocation${loop.index} = new google.maps.LatLng( lat${loop.index},lng${loop.index});
		         	     newlocation.push(newlocation${loop.index});
		         	     myContent.push(content);
		         	     myId.push(id);
		         </script>
		         <div class="rfamous">
		         	<b>Món nổi tiếng: ${i.monNoiTieng }</b>
		         </div>
		        
		    		</div>              	 	
		   </div>	
		     
		   </div><!-- /RTS Item -->
		  </c:forEach>
 		</div> 
 		<!-- child of the body tag -->
		<span id="top-link-block" class="hidden">
		    <a href="#top" class="well well-sm" onclick="$('html,body').animate({scrollTop:0},'slow');return false;" id="top">
		        <i class="glyphicon glyphicon-chevron-up"></i> Back to Top
		    </a>
		</span><!-- /top-link-block --> 	
		<script>
		// Only enable if the document has a long scroll bar
		// Note the window height + offset
			if ( ($(window).height() + 100) < $(document).height() ) {
			    $('#top-link-block').removeClass('hidden').affix({
			        // how far to scroll down before link "slides" into view
			        offset: {top:100}
			        
			    });
			}
		   
		</script>
		
  	</div>
   
  	</c:if>
   	
   	</div>
 
  
 		
		
  </div> 
			
<script>
	var lat = 1;
	var lng = 1;
    var placeKeyword;
    var x = document.getElementById("demo");
    
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

<c:if test="${lat != 0 }">
		<script type="text/javascript">
		
		 	lat = ${lat};
	   		lng = ${lng};
	   	 var lat =${lat};
	  	  var lng = ${lng};
	  	 var image = "http://2.pik.vn/2016d1c7ab21-652e-435a-a193-358eaafc1f50.png";
	  	  var infoWindow = new google.maps.InfoWindow({
	          content : "Vị trí của bạn"
	        });
		  var myLatLng1 = new google.maps.LatLng(lat,lng);
         var marker1 = new google.maps.Marker({
         position : myLatLng1,
         map : map,
         icon: image
       });
    	 var myOptions = {
   	        center : myLatLng1,
   	        zoom: 16,
   	        mapTypeId: google.maps.MapTypeId.ROADMAP
   	      }
     
     	map = new google.maps.Map(document.getElementById("googleMap"),myOptions);  
    	
    	 google.maps.event.addListener(marker1, 'click', function(){
             
             map.setCenter(marker1.getPosition());
             infoWindow.open(map,marker1);
             
           });
   	  marker1.setMap(map);
   	  for (var i = 0; i < newlocation.length; i++) {
	   		 console.log(newlocation);
   		      var image = "http://2.pik.vn/20162448607e-35a4-4505-8070-9ee784a7bce6.png";
			  var marker = new google.maps.Marker({
		          position: newlocation[i],
		          map: map,
		          icon: image
	     		 });
			  var content = myContent[i];
			  var id = myId[i];
			  var infowindow = new google.maps.InfoWindow()

			  google.maps.event.addListener(marker,'click', (function(marker,content,infowindow){ 
			          return function() {
			             infowindow.setContent(content);
			             infowindow.open(map,marker);
			             
			          };
			      })(marker,content,infowindow)); 

			  google.maps.event.addListener(marker,'dblclick', (function(marker,id){ 
			          return function() {
			             
			        	  test(id);
			          };
			      })(marker,id)); 
			  var cityCircle = new google.maps.Circle({
		            strokeColor: '#FF0000',
		            strokeOpacity: 0.8,
		            strokeWeight: 2,
		            fillColor: '',
		            fillOpacity: 0.0,
		            map: map,
		            center: myLatLng1,
		            radius: 550
		          });
	     
 		}
 		function test(id)
 		{
 			var url = window.location.href.indexOf('#');
 			if(url!= -1)
 				{
 					window.location.href=window.location.href.substr(0, window.location.href.indexOf('#')) + "#" + id;
 				}
 			else
 				{
 					window.location.href=window.location + "#" + id;
 				}
 			
 		}
 		
 		
		</script>
	</c:if>
<jsp:include page="Layout/_footer.jsp"/>
