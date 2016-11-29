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
            	<p id="resultcmt" class="fail"></p>
              <label for="">Bình luận</label>
              <textarea name="name" id="cmt" onfocus="clearContents(this);">Nhập bình luận của bạn</textarea>
			  <button type="button" class="btn btn-success green" id="btncmt"><i class="fa fa-share"></i> Bình luận</button>
            </form>
            <script type="text/javascript">
           		 function clearContents(element) {
            	  element.value = '';
            	}
            	function processJsonCmt(data)
            	{
            		if(data.result == 'success' )
            		{	$("#resultcmt").removeClass('fail');
            			$('#resultcmt').addClass('scs');
            			$('#resultcmt').text("Cảm ơn bạn đã nhận xét.Bình luận của bạn sẽ được duyệt trước khi hiển thị");
            			var element = document.getElementById("cmt");
            			element.value = 'Nhập bình luận của bạn';
            		}
            	}
            	/*
            	$("#cmt").click(function(){
            		$("#cmt").text("");
            	}); */
            	$("#btncmt").click(function(){
            		var usn ='${sessionScope.username}';
            		var content = $("#cmt").val();            		
    				if(usn=='')
    					{
    						$("#resultcmt").text("Vui lòng đăng nhập để có thể bình luận");
    					}
    				else
    					{
	    					if(content==""||content=="Nhập bình luận của bạn")
	            			{
	            				$("#resultcmt").text("Vui lòng nhập nội dung bình luận");
	            			}
	            			else
	            			{
	            				var rtsid="${requestScope.rts.id}";
	            				var dataToSubmit={'usn':usn,'rtsid':rtsid,'content':content};
	            				
	    						console.log(dataToSubmit);
	    						$.ajax({
	    			   				url: 'comment.html',
	    			   				type: 'POST',
	    			   				data: dataToSubmit,
	    			   				dataType: 'json',
	    			   				success: processJsonCmt
	    			   			});
	    					
	            			}
    						
    					}
            	});
            	
			</script>
          </div>
        </div>

      </div><!-- /comment -->
      <div class="col-lg-4" style="margin-top:20px;">
      
		<c:if test="${not empty list }">
  				<iframe src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2Fthongtindoanhoiute%2F&tabs=timeline&width=340&height=500&small_header=false&adapt_container_width=true&hide_cover=false&show_facepile=true&appId" width="340" height="500" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true">
      			</iframe>
 		 </c:if>
      
      </div>
    </div>
  </div>
  
  
<jsp:include page="Layout/_footer.jsp"/>
