<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<%@ page pageEncoding="utf-8"%>
<jsp:include page="Layout/_header.jsp"/>
<div class="container">
  
	<jsp:include page="Layout/_rtsinfo.jsp"/>
    <div class="row" style="background-color: rgb(245, 245, 245); margin-bottom:10px; padding-left:50px;">
      <jsp:include page="Layout/_category.jsp"/>

      <div class="col-lg-8" style="margin-top:20px;"><!-- Comment -->
      	
      	<div>
      		<c:forEach var="l" items="${list }">
      		<div class="row" style="background-color:white; padding:10px;margin-bottom:10px; "><!-- Row -->
		          <div class="avt-info">
		            <div style="width:55px;float:left;">
		              <img src="images/${l.user.hinhAnh }" alt="" class="img-responsive"/>
		            </div>
		              <div class="account-info"  style="width:500px;float:left; margin-top:10px;margin-left:25px;">
		                <a href="" class="member"><span class="member-name">${l.user.tenNguoiDung }</span></a>
		              </div>
		              <div style="width:500px;">
		                <p>
		                  <i class="fa fa-comments-o cmt-time" ></i>
		                  <span class="cmt-time">${l.ngayThem }</span>
		                </p>
		
		              </div>
		
		           
		
		          </div>
		          <div class="comment" style="margin-top:40px;">
		            <p>
		             	${l.noiDung}
		            </p>
		
		            <div class="rating-heart">
		              <i class="fa fa-heart"></i> <a style="cursor:pointer;">Thích</a>
		            </div>
		          </div>
		        </div><!-- End Row -->
      	</c:forEach>
      	</div>
      
      
        


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
