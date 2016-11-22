<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<jsp:include page="Layout/_header.jsp"/>
 <font size="12" color="red"><c:if test="${not empty errorM }">Không tìm thấy quán ăn</c:if>
		    	</font>
	<c:if test="${not empty listRts  }">
		<c:forEach var="i" items="${listRts}">
		  	
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
		           <span class="town">${i.tenPhuong }</span> -
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
		
	</c:if>
	
  	
<jsp:include page="Layout/_footer.jsp"/>