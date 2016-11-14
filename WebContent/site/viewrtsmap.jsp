<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<%@ page pageEncoding="utf-8"%>
<jsp:include page="Layout/_header.jsp"/>
 <div class="container">
   
    <jsp:include page="Layout/_rtsinfo.jsp"/>

    <div class="row" style="background-color: rgb(245, 245, 245); margin-bottom:10px; padding-left:50px;">
   	  
	<jsp:include page="Layout/_category.jsp"/>

      <div class="col-lg-8" style="margin-top:20px;"><!-- Comment -->
        <div id="googleMap" style="width: 800px; height: 300px;">Google Map</div>

      </div><!-- /comment -->
      <div class="col-lg-4" style="margin-top:20px;">

      <iframe src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2Fthongtindoanhoiute%2F&tabs=timeline&width=340&height=500&small_header=false&adapt_container_width=true&hide_cover=false&show_facepile=true&appId" width="340" height="300" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true">
      </iframe>
      </div>
    </div>
  </div>
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBwTYGP_-vrJ6AAmCuYPY8mFRso4jfCUsQ&sensor=false"></script>
  <script type="text/javascript">
  var gmap = new google.maps.LatLng(${rts.lat},  ${rts.lng});
  var marker;
  function initialize()
  {
          var mapProp = {
               center:new google.maps.LatLng(${rts.lat}, ${rts.lng}),
               zoom:16,
              mapTypeId:google.maps.MapTypeId.ROADMAP
          };

          var map=new google.maps.Map(document.getElementById("googleMap")
          ,mapProp);

        var styles = [
          {
            featureType: 'road.arterial',
            elementType: 'all',
            stylers: [
              { hue: '#fff' },
              { saturation: 100 },
              { lightness: -48 },
              { visibility: 'on' }
            ]
          },{
            featureType: 'road',
            elementType: 'all',
            stylers: [

            ]
          },
          {
              featureType: 'water',
              elementType: 'geometry.fill',
              stylers: [
                  { color: '#adc9b8' }
              ]
          },{
              featureType: 'landscape.natural',
              elementType: 'all',
              stylers: [
                  { hue: '#809f80' },
                  { lightness: -35 }
              ]
          }
        ];

        var styledMapType = new google.maps.StyledMapType(styles);
        map.mapTypes.set('Styled', styledMapType);

        marker = new google.maps.Marker({
          map:map,
          draggable:true,
          animation: google.maps.Animation.DROP,
          position: gmap
        });

        var infoWindow = new google.maps.InfoWindow({
          content : "${rts.tenQuanAn}"
        });


        google.maps.event.addListener(marker, 'click', toggleBounce);
        google.maps.event.addListener(marker, 'click', function(){
          map.setZoom(18);
          map.setCenter(marker.getPosition());
          infoWindow.open(map,marker);
        });

    }

        function toggleBounce() {

        if (marker.getAnimation() !== null) {
          marker.setAnimation(null);
        } else {
          marker.setAnimation(google.maps.Animation.BOUNCE);
        }
  }

  google.maps.event.addDomListener(window, 'load', initialize);
  </script>
<jsp:include page="Layout/_footer.jsp"/>