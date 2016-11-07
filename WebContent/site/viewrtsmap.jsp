<%@ page pageEncoding="utf-8"%>
<jsp:include page="Layout/_header.jsp"/>
 <div class="container">
    <div class="row" style="margin:20px 100px; ">
      <div class="col-lg-5"><!-- image restaurant -->
        <a href="#"><img src="images/launuong.jpg" alt="" /></a>
      </div><!-- /image rts -->
      <div class="col-lg-7">
        <ol class="breadcrumb"><!-- Area -->
          <li><a href="#">Thủ Đức</a></li>
          <li><a href="#">Linh Chiểu</a></li>
          <li class="active">Võ Văn Ngân</li>
        </ol><!-- /Area -->

        <h3><i class="fa fa-check-circle" style="color:#4733b7;"></i> Lẩu nướng</h3>
        <p>
          <span class="glyphicon glyphicon-tags"></span>
          <a>Quán ăn</a>
          -
          <a>Món nướng</a>

        </p>
        <div class="review"><!-- Review -->
          <div class="rating-point" >
            <div class="">
              <p style="text-align:center;">
                6.9
              </p>
            </div>
            <div class="label" style="color: #4733b7;  margin-left:10px;">
              Điểm đánh giá
            </div>
          </div>
          <div class="rating-number" >
            <div class="">
              <p style="text-align:center;">
                69
              </p>
            </div>
            <div class="label" style="color: #4733b7;">
              Lượt đánh giá
            </div>
          </div>
          <div class="comment-number" >
            <div class="">
              <p style="text-align:center;">
                96
              </p>
            </div>
            <div class="label" style="color: #4733b7;">
              Bình luận
            </div>
          </div>
        </div><!-- /review -->
        <div class="address">
          <address class="">
          <i class="fa fa-location-arrow"></i>  01 , <a href="#">Võ Văn Ngân</a> - <a href="#">Linh Chiểu</a> - <a href="#">Thủ Đức</a> - TP HCM
          </address>
        </div>
        <div class="money">
          <i class="fa fa-cutlery"></i> 150.000 - 250.000
        </div>

      </div>
    </div><!-- End row -->

    <div class="row" style="background-color: rgb(245, 245, 245); margin-bottom:10px; padding-left:50px;">
      <div class="rts-category">
        <ul>
          <li class="li-rts"><a href="viewrts.jsp"><label for="comment">Bình luận</label></a></li>
          <li class="li-rts"><a href="view-rts-menu.jsp"><label for="menu">Thực đơn</label></a></li>
          <li class="li-rts"><a href="view-rts-img.jsp"><label for="picture-list">Hình ảnh</label></a></li>
          <li class="li-rts"><a href="viewrtsmap.jsp"><label for="map-list">Bản đồ</label></a></li>
        </ul>

      </div>

      <div class="col-lg-8" style="margin-top:20px;"><!-- Comment -->
        <div id="googleMap" style="width: 800px; height: 300px;">Google Map</div>

      </div><!-- /comment -->
      <div class="col-lg-4" style="margin-top:20px;">

      <iframe src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2Fthongtindoanhoiute%2F&tabs=timeline&width=340&height=500&small_header=false&adapt_container_width=true&hide_cover=false&show_facepile=true&appId" width="340" height="300" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true">
      </iframe>
      </div>
    </div>
  </div>
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
  <script type="text/javascript">
  var gmap = new google.maps.LatLng(10.849301, 106.773904);
  var marker;
  function initialize()
  {
          var mapProp = {
               center:new google.maps.LatLng(10.849301, 106.773904),
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
          content : "DH SPKT!!!!"
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