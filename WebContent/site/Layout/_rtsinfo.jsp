  <%@ page pageEncoding="utf-8"%>
  <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
  <script type="text/javascript" src="rating/jquery-2.1.1.js"></script>
    <script type="text/javascript" src="rating/jquery-rating.js"></script>
    <link rel="stylesheet" type="text/css" href="rating/jquery-rating.css">
  <div class="row" style="margin:20px 100px; ">
      <div class="col-lg-5"><!-- image restaurant -->
         <a href="#"><img src="images/${rts.hinhAnh}" alt="" style="max-height: 300px;"/></a>
         <div class="rating">
         	<h3>Đánh giá quán ăn</h3>
	         <div class="group1">
		
		  		<div   class="jr-ratenode jr-nomal"></div>
		  		<div   class="jr-ratenode jr-nomal "></div>
		  		<div   class="jr-ratenode jr-nomal "></div>
		  		<div   class="jr-ratenode jr-nomal "></div>
		  		<div   class="jr-ratenode jr-nomal "></div>
		  	</div>
		  	<div >
		  		<p id="info" >0</p>
		  		<p id="result" class="fail"></p>
		  	</div>
		  	
         </div>
      	
	  	
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
    
    <script type="text/javascript">
    function processJson(data){
    	
    	if(data.result == 'success' )
    		{	$("#result").removeClass('fail');
    			$('#result').addClass('scs');
    			$('#result').text("Cảm ơn đánh giá của bạn");
    		}
    	if(data.result == 'fail' )
    		{
    			$("#result").removeClass('scs');
				$('#result').addClass('fail');
				$('#result').text("Bạn đã đánh giá quán ăn này!!");
    		}
    		
    }
    var v = 0;
    $('.group1').start(function(cur){
       	v = cur;
         $('#info').text(cur);
         $("#btnrating").removeAttr("disabled")
         
         
         
        
        	 
        
      });
    
    $(".jr-ratenode").click(function() {
	     //var v = cur;
	     var usn ='${sessionScope.username}';
        var x = "${requestScope.rts.id}";
	     console.log(v);
	 	 if(usn=='')
	 		 {
	 		$('#result').text("Vui lòng đăng nhập để có thể đánh giá quán ăn");
	 		 }
	   	 if(usn != '')
	   	 {
	       	 var dataToSubmit = {'usn':'<c:out value="${sessionScope.username}"></c:out>', 'cur':v,'id':'<c:out value="${requestScope.rts.id}"></c:out>'};
	       	
	            $.ajax({
	   				url: 'rating.html',
	   				type: 'POST',
	   				data: dataToSubmit,
	   				dataType: 'json',
	   				success: processJson
	   			});
	        }
	  });
   
    </script>