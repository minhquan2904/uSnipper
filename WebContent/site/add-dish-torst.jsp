<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<jsp:include page="Layout/_header.jsp"></jsp:include>
 <div class="container">
    <div class="col-lg-2" >
     <jsp:include page="Layout/_list-group-editor.jsp"></jsp:include>
    </div>
    <div class="col-lg-10"  >
      <div class="row" style="padding:20px;">
      <fieldset disabled="disabled">
        <label for="rts-name"  style="font-size: 20px;">Tên quán ăn</label>
        <input type="text" class="form-control" id="rts" placeholder="Nhập tên quán ăn" name="rname" value="${rname}">
        
      </fieldset>
      
      <font size="12" color="red"><c:if test="${not empty hasDish }">Món ăn đã tồn tại !!!!</c:if>
      							
      </font>
     	 <label for="rts-name"  style="font-size: 20px;">Thêm món ăn</label>
       <form action="addDishToRts.html" method="post" enctype="multipart/form-data">
       	 <input type="text" class="form-control"  placeholder="Nhập idMonAn" name="idDish" value="" style="margin-top: 20px;">
       	 
       	 <p id="passwordHelpBlock" class="form-text text-muted">
		 Hướng dẫn: Điền thông tin tương ứng vào các input. Thông tin các món ăn xem table Danh sách món ăn. Nếu món ăn chưa tồn tại, chọn thêm món ăn mới trước khi thêm món ăn đó vào quán ăn 
		</p>
		
		<button type="button" class="btn btn-primary" id="abtn">Thêm món ăn mới</button>
		
       	  <input type="text" class="form-control" placeholder="Nhập mô tả" name="describe" value="" style="margin-top: 20px;">
       	  
       	  <input type="number" class="form-control ip-mg" placeholder="Nhập giá tiền" name="price" value="" style="margin-top: 20px;">
       	   Hình ảnh món ăn  <input type="file" name="pic" accept="image/x-png,image/gif,image/jpeg">
       	   
       	  <button type="submit" class="btn btn-primary" style="margin-top:10px;" >Tiếp tục</button>
       	  
       </form>
       <button type="submit" class="btn btn-primary" id="scs" style="margin-top:10px;">Hoàn tất</button>
       <script type="text/javascript">
       	$("#scs").click(function(){
       		window.location.replace("profile.html");
       	});
       	$("#abtn").click(function(){
       		window.location.replace("add-new-dish.html");
       	});
       </script>
       
      <hr>
      <h3> Các món ăn của quán ${rname} </h3>
      
      <c:if test="${not empty listDish}">      
	      <table class="table table-striped">
	      		<thead>
	     			<tr>
	     				<th>STT</th>
	     				<th>idMonAn</th>
	     				<th>idQuanAn</th>
	     				<th>Mô tả</th>
	     				<th>Giá tiền</th>
	     			</tr>
	     		</thead>
	     		<tbody>
	     			<c:forEach var="l" items="${listDish}" varStatus="loop">
	     				<tr>
	     					<td>${loop.index +1}</td>
	     					<td>${l.idMonAn}</td>
	     					<td>${l.idQuanAn}</td>
	     					<td>${l.moTa}</td>
	     					<td>${l.giaTien}</td>
	     				</tr>
	     			</c:forEach>
	     		</tbody>
	      	</table>
      </c:if>
      	
      	<h3>Danh sách món ăn</h3>
     	<table class="table table-striped">
     		<thead>
     			<tr>
     				<th>STT</th>
     				<th>id</th>
     				<th>Tên món ăn</th>
     			</tr>
     		</thead>
     		<tbody>
     			<c:forEach var="l" items="${list}" varStatus="loop">
     				<tr>
     					<td>${loop.index +1}</td>
     					<td>${l.id}</td>
     					<td>${l.tenMonAn}</td>
     				</tr>
     			</c:forEach>
     		</tbody>
     	</table>
       
      </div>

    </div>
 </div>
<jsp:include page="Layout/_footer.jsp"></jsp:include>