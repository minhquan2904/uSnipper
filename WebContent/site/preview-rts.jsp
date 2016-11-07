<%@ page pageEncoding="utf-8"%>
<jsp:include page="Layout/_header.jsp"/>
 <div class="container">
    <div class="row" style="margin:20px 100px; ">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin:10px;">
        <a href="addrts-admin.jsp" class="btn btn-default"><span class="glyphicon glyphicon-arrow-left"></span> Quay lại</a>
        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal1" style="float:right;margin-right:20p">Xác nhận</button>
        <!-- set up the modal to start hidden and fade in and out -->
        <div id="myModal1" class="modal fade" role="dialog">
        <div class="modal-dialog">

          <!-- Modal content-->
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">Xác nhận</h4>
            </div>
            <div class="modal-body">
              <p><i>Bạn xác nhận thêm quán ăn?</i><br></p>
              <p>
                Bấm Confirm để xác nhận, bấm Close để thoát.
              </p>

            </div>
            <div class="modal-footer">
              <a href="demo.jsp" class="btn btn-default">Confirm</a>
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

            </div>
          </div>

        </div>
        </div>
      </div>
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
                0
              </p>
            </div>
            <div class="label" style="color: #4733b7;  margin-left:10px;">
              Điểm đánh giá
            </div>
          </div>
          <div class="rating-number" >
            <div class="">
              <p style="text-align:center;">
                0
              </p>
            </div>
            <div class="label" style="color: #4733b7;">
              Lượt đánh giá
            </div>
          </div>
          <div class="comment-number" >
            <div class="">
              <p style="text-align:center;">
                0
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
        <div class="mymap">
          <button type="button" class="btn btn-default btnmap" data-toggle="modal" data-target="#myModal" >Bản đồ</button>
        <div id="myModal" class="modal fade" role="dialog">
          <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Vị trí quán ăn</h4>
              </div>
              <div class="modal-body">
                <div id="map_canvas" style="width: 560px;height:398px;"></div>
              </div>

            </div>

          </div>
        </div>
        </div>
      </div>
    </div><!-- End row -->

    <div class="row" style="background-color: rgb(245, 245, 245); margin-bottom:10px; padding-left:50px;">
      <div class="rts-category">
        <ul>
          <li class="li-rts"><a href="view-rts.jsp"><label for="comment">Bình luận</label></a></li>
          <li class="li-rts"><a href="view-rts-menu.jsp"><label for="menu">Thực đơn</label></a></li>
          <li class="li-rts"><a href="view-rts-img.jsp"><label for="picture-list">Hình ảnh</label></a></li>



        </ul>

      </div>

      <div class="col-lg-8" style="margin-top:20px;"><!-- Comment -->
        <div class="row" style="background-color:white; height:500px; ">




        </div>
      </div><!-- /comment -->
      <div class="col-lg-4" style="margin-top:20px;">

      <iframe src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2Fthongtindoanhoiute%2F&tabs=timeline&width=340&height=500&small_header=false&adapt_container_width=true&hide_cover=false&show_facepile=true&appId" width="340" height="500" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true">
      </iframe>
      </div>
    </div>
  </div>

<script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script>
  $(document).ready(

    $("#myModal1").on("show", function() {    // wire up the OK button to dismiss the modal when shown
        $("#myModal1 a.btn").on("click", function(e) {
            console.log("button pressed");   // just as an example...
            $("#myModal1").modal('hide');     // dismiss the dialog
        });
    }));
    $("#myModal1").on("hide", function() {    // remove the event listeners when the dialog is dismissed
        $("#myModal1 a.btn").off("click");
    });

    $("#myModal1").on("hidden", function() {  // remove the actual elements from the DOM when fully hidden
        $("#myModal1").remove();
    });

    $("#myModal1").modal({                    // wire up the actual modal functionality and show the dialog
      "backdrop"  : "static",
      "keyboard"  : true,
      "show"      : true                     // ensure the modal is shown immediately
    });

  
</script>
    <script>
        function initialize() {
            var myLatlng = new google.maps.LatLng(10.849301, 106.773904);
            var mapOptions = {
                zoom: 15,
                center: myLatlng
            };

            var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);



            var marker = new google.maps.Marker({
                position: myLatlng,
                map: map,

            });
            infowindow.open(map, marker);
        }

        google.maps.event.addDomListener(window, 'load', initialize);


    </script>



<jsp:include page="Layout/_footer.jsp"/>
