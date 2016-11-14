<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<%@ page pageEncoding="utf-8"%>
<jsp:include page="Layout/_header.jsp"/>
  <div class="container">
    <jsp:include page="Layout/_rtsinfo.jsp"/>

    <div class="row" style="background-color: rgb(245, 245, 245); margin-bottom:10px; padding-left:50px;">
        <jsp:include page="Layout/_category.jsp"/>

      <div class="col-lg-8 " style="margin-top:20px;"><!-- Comment -->
        <div class="row" style="background-color:white; ">
            <h3>Thực đơn</h3>
            
            <c:forEach var="l" items="${list}">
            	 <div class="col-lg-4" style="width:405px;padding:10px;">
		              <div class="menu">
		                <img src="${l.hinhAnh}" alt="" class="menu-img" />
		                <label for="dish-name" class="dish-name">${l.dishId.tenMonAn }</label>
		                <hr>
		                <label for="dish-price" class="dish-name">Giá: ${l.giaTien }</label>
		              </div>
             

           		 </div>
            </c:forEach>
            
           
            

        </div>


      </div><!-- /comment -->
      <div class="col-lg-4" style="margin-top:20px;">

      <iframe src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2Fthongtindoanhoiute%2F&tabs=timeline&width=340&height=500&small_header=false&adapt_container_width=true&hide_cover=false&show_facepile=true&appId" width="340" height="500" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true">
      </iframe>
      </div>
    </div>
  </div>
<jsp:include page="Layout/_footer.jsp"/>