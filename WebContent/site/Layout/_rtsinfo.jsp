  <%@ page pageEncoding="utf-8"%>
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
            <div class="avgpoint">
              <p style="text-align:center;">
                ${rts.diemTB }
              </p>
            </div>
            <div class="label" style="color: #4733b7;  margin-left:10px;">
              Điểm đánh giá
            </div>
          </div>
          <div class="rating-number" >
            <div class="total">
              <p style="text-align:center;">
                ${rts.luotDanhGia }
              </p>
            </div>
            <div class="label" style="color: #4733b7;">
              Lượt đánh giá
            </div>
          </div>
          <div class="comment-number" >
            <div class="">
              <p style="text-align:center;">
                ${total }
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
        <div class="Details address" style="font-family: R">
        	${rts.moTa }
        </div>
        <div class="money">
          <i class="fa fa-cutlery"></i> 150.000 - 250.000
        </div>
        
        </div>
      </div>
    </div><!-- End row -->