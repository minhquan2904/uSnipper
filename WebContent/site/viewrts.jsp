<%@ page pageEncoding="utf-8"%>
<jsp:include page="Layout/_header.jsp"/>
<div class="container">
    <div class="row" style="margin:20px 100px; ">
      <div class="col-lg-5"><!-- image restaurant -->
        <a href="#"><img src="${rts.hinhAnh}" alt="" /></a>
      </div><!-- /image rts -->
      <div class="col-lg-7">
        <ol class="breadcrumb"><!-- Area -->
          <li><a href="#">Thủ Đức</a></li>
          <li><a href="#">Linh Chiểu</a></li>
          <li class="active">Võ Văn Ngân</li>
        </ol><!-- /Area -->
		
		<div class="rname"><h3><i class="fa fa-check-circle" style="color:#4733b7;"></i> ${rts.tenQuanAn}</h3></div>
        
        <div class="rname"> <span class="glyphicon glyphicon-tags" style="padding-right:15px;"> </span>Quán ăn - ${type}</div>        
      
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
          <i class="fa fa-location-arrow"></i>  ${rts.soNha} - <a href="#">${rts.tenDuong}</a> - <a href="#">${rts.tenPhuong}</a> - <a href="#">${rts.tenQuan} </a> - TP HCM
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
          <li class="li-rts"><a href="view-rts.jsp"><label for="comment">Bình luận</label></a></li>
          <li class="li-rts"><a href="view-rts-menu.jsp"><label for="menu">Thực đơn</label></a></li>
          <li class="li-rts"><a href="view-rts-img.jsp"><label for="picture-list">Hình ảnh</label></a></li>
          <li class="li-rts"><a href="viewrtsmap.jsp"><label for="map-list">Bản đồ</label></a></li>
        </ul>

      </div>

      <div class="col-lg-8" style="margin-top:20px;"><!-- Comment -->
        <div class="row" style="background-color:white; padding:10px; "><!-- Row -->
          <div class="avt-info">
            <div style="width:55px;float:left;">
              <img src="images/mqavt.jpg" alt="" class="img-responsive"/>
            </div>
              <div class="account-info"  style="width:500px;float:left; margin-top:10px;margin-left:25px;">
                <a href="" class="member"><span class="member-name">Minh Quân Bùi</span></a>
              </div>
              <div style="width:500px;">
                <p>
                  <i class="fa fa-comments-o cmt-time" ></i>
                  <span class="cmt-time">10/15/2016 10:27</span>
                </p>

              </div>

            </p>

          </div>
          <div class="comment" style="margin-top:40px;">
            <p>
              Món ăn ở đây ngon lắm, lại rẻ nữa. Sinh viên tụi mình vô đây ăn là nhịn đói cả tháng luôn, nhưng mà mình thích thì mình ăn thôi. Ahihi!
            </p>

            <div class="rating-heart">
              <i class="fa fa-heart"></i> <a style="cursor:pointer;">Thích</a>
            </div>
          </div>
        </div><!-- End Row -->

        <div class="row" style="background-color:white; margin-top:20px;  padding:10px;"><!-- row -->
          <div class="avt-info">
            <div style="width:55px;float:left;">
              <img src="images/mqavt.jpg" alt="" class="img-responsive"/>
            </div>
              <div class="account-info"  style="width:500px;float:left; margin-top:10px;margin-left:25px;">
                <a href="" class="member"><span class="member-name">Minh Quân Bùi</span></a>
              </div>
              <div style="width:500px;">
                <p>
                  <i class="fa fa-comments-o cmt-time" ></i>
                  <span class="cmt-time">10/15/2016 10:27</span>
                </p>

              </div>

            </p>

          </div>
          <div class="comment" style="margin-top:40px;">
            <p>
              Món ăn ở đây ngon lắm, lại rẻ nữa. Sinh viên tụi mình vô đây ăn là nhịn đói cả tháng luôn, nhưng mà mình thích thì mình ăn thôi. Ahihi!
            </p>
            <a href="#"><img src="images/launuong.jpg" alt="" class="img-comment" /></a>
            <div class="rating-heart">
              <i class="fa fa-heart"></i> <a style="cursor:pointer;">Thích</a>
            </div>
          </div>
        </div><!-- End row -->

        <div class="row">
          <div class="addcmt">
            <form class="cmtform" action="index.jsp" method="post">
              <label for="">Bình luận</label>
              <textarea name="name" >Nhập bình luận của bạn</textarea>
              <ul>
											<li><a title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Audio"><i class="fa fa-music"></i></a></li>
											<li><a title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Video"><i class="fa fa-video-camera"></i></a></li>
											<li><a title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Sound Record"><i class="fa fa-microphone"></i></a></li>
											<li><a title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Picture"><i class="fa fa-picture-o"></i></a></li>
							</ul>
							<button type="submit" class="btn btn-success green"><i class="fa fa-share"></i> Share</button>
            </form>
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
