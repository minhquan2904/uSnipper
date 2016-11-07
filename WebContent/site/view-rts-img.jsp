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
        <div class="row" style="background-color: white;">
          <h3>Hình ảnh</h3>
          <div class="box-img">
            <div class="album-img">
              <div class="img-mem">
                <a href="#" class="rts-img"><img src="images/han1.png" alt="" /></a>
              </div>
            </div>
            <div class="album-img">
              <div class="img-mem">
                <a href="#" class="rts-img"><img src="images/han1.png" alt="" /></a>
              </div>
            </div>
            <div class="album-img">
              <div class="img-mem">
                <a href="#" class="rts-img"><img src="images/han1.png" alt="" /></a>
              </div>
            </div>
            <div class="album-img">
              <div class="img-mem">
                <a href="#" class="rts-img"><img src="images/han1.png" alt="" /></a>
              </div>
            </div>
            <div class="album-img">
              <div class="img-mem">
                <a href="#" class="rts-img"><img src="images/han1.png" alt="" /></a>
              </div>
            </div>
            <div class="album-img">
              <div class="img-mem">
                <a href="#" class="rts-img"><img src="images/han1.png" alt="" /></a>
              </div>
            </div>
            <div class="album-img">
              <div class="img-mem">
                <a href="#" class="rts-img"><img src="images/han1.png" alt="" /></a>
              </div>
            </div>
            <div class="album-img">
              <div class="img-mem">
                <a href="#" class="rts-img"><img src="images/han1.png" alt="" /></a>
              </div>
            </div>
            <div class="album-img">
              <div class="img-mem">
                <a href="#" class="rts-img"><img src="images/han1.png" alt="" /></a>
              </div>
            </div>
            <div class="album-img">
              <div class="img-mem">
                <a href="#" class="rts-img"><img src="images/han1.png" alt="" /></a>
              </div>
            </div>
            <div class="album-img">
              <div class="img-mem">
                <a href="#" class="rts-img"><img src="images/han1.png" alt="" /></a>
              </div>
            </div>
            <div class="album-img">
              <div class="img-mem">
                <a href="#" class="rts-img"><img src="images/han1.png" alt="" /></a>
              </div>
            </div>
          </div>

        </div>
      </div><!-- /comment -->
      <div class="col-lg-4" style="margin-top:20px;">

      <iframe src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2Fthongtindoanhoiute%2F&tabs=timeline&width=340&height=500&small_header=false&adapt_container_width=true&hide_cover=false&show_facepile=true&appId" width="340" height="500" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true">
      </iframe>
      </div>
    </div>
  </div>


<jsp:include page="Layout/_footer.jsp"/>