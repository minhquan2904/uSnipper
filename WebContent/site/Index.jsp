
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<%@ page pageEncoding="utf-8"%>
<jsp:include page="Layout/_header.jsp" />
  <style media="screen">
    body {
      background-color: #EEEEEE;
    }
  </style>
  <div class="sp-body"><!-- body -->
    <div class="col-lg-9"><!-- main page -->
      <div id="myCarousel" class="carousel slide" data-ride="carousel"><!-- carousel -->
          <!-- Indicators -->
          <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
            <li data-target="#myCarousel" data-slide-to="3"></li>
            <li data-target="#myCarousel" data-slide-to="4"></li>
            <li data-target="#myCarousel" data-slide-to="5"></li>
            <li data-target="#myCarousel" data-slide-to="6"></li>
          </ol>

          <!-- Wrapper for slides -->
          <div class="carousel-inner" role="listbox">
          	<c:forEach var="l" items="${listRts }">
          	<div class="item ">
              <a href="viewrts.html?id=${l.id}"><img src="images/${l.hinhAnh}" alt="" class="itclk" style="width:910px;height:400px;"></a>
              <div class="carousel-caption">
                <h3>${l.tenQuanAn}</h3>
               
                <p>Lượt xem: ${l.luotTraCuu}</p><br>
                <p>Đánh giá: ${l.diemTB }/5</p>
                
              </div>
            </div>
          	
          	</c:forEach>         



           
          </div>

          <!-- Left and right controls -->
          <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div><!-- /carousel -->
        
        
        <div class="new-rts"><!-- New rts -->
          <div class="panel panel-default" style="margin-top:20px;">
            <div class="panel-heading">
              <h3 class="panel-title">Quán ăn mới</h3>
            </div>
            <div class="panel-body">
              <div class="row"><!-- RTS -->
                
                <c:forEach var="i" items="${listnew}">
                	
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
			                      <span class="dist">${i.tenQuan}
			                      Thành phố Hồ Chí Minh</span></i>
			                    </address>
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
                
               
              </div><!-- /RTS -->

            </div>

          </div>
        </div><!-- /New rts -->

     
    </div><!-- /main page -->
    <div class="col-lg-3">
      <iframe src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2Fthongtindoanhoiute%2F&tabs=timeline&width=340&height=500&small_header=false&adapt_container_width=true&hide_cover=false&show_facepile=true&appId" width="300" height="400" style="border:none;overflow:hidden;" scrolling="no" frameborder="0" allowTransparency="true">
      </iframe>
    </div>
  </div><!-- /body -->
    <script type="text/javascript">
    $( document ).ready(function() {
    	document.getElementsByClassName("item")[0].setAttribute("class","item active");
    	});
      function move(){
        window.location("viewrts.jsp")
      }
      $(".itclk").click(function(){
        move();
      });
    </script>
<jsp:include page="Layout/_footer.jsp"></jsp:include>