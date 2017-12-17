<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<jsp:include page="Layout/_header.jsp"></jsp:include>
 <div class="container">
    <div class="col-lg-2" >
     <jsp:include page="Layout/_list-group-editor.jsp"></jsp:include>

    </div>
    <div class="col-lg-10"  >
      <div class="row" >
        <form class="form-inline" action="admin/addRts.html" method="post" enctype="multipart/form-data">
          <h3 style="disabled;color:white;background-color:#4733b7;text-align:center; padding:10px;margin-left:10px;"><b>Thêm quán ăn</b></h3>
			<font color="red" size="20px;"><c:if test="${not empty errorMs }">
           				 <c:out value="${errorMs}" />
           		 </c:if></font>
            <div class="form-group"><!-- RTS name -->
              <label for="rts-name"  style="font-size: 20px;">Tên quán ăn</label>
              <input type="text" class="form-control" id="rts" placeholder="Nhập tên quán ăn" name="rname">
            </div><!-- /RTS name -->
            <hr>
            <div class="form-group"><!-- RTS type -->
              <label for="type"  style="font-size: 20px;">Loại quán ăn</label>
              <br>
              <div class="checkbox-inline">
                <label class="checkbox-inline"><input type="radio" value="1" name="type"> Cơm bình dân</label>
                <label class="checkbox-inline"><input type="radio" value="2" name="type"> Cơm tấm</label>
                <label class="checkbox-inline"><input type="radio" value="3" name="type"> Cơm gà,bò xào</label>
                <label class="checkbox-inline"><input type="radio" value="4" name="type"> Cơm chay</label>
                <label class="checkbox-inline"><input type="radio" value="5" name="type"> Hủ tiếu</label>
                <label class="checkbox-inline"><input type="radio" value="6" name="type"> Phở</label>
              </div><!-- /RTS type -->
              <hr>
				<br>
            </div>

          
             
            
         <!-- Address -->
          <div class="form-group" style="">
           <label for="address" style="font-size: 20px;">Địa chỉ</label>
            <label for="number"style="margin-left:10px;" >Số nhà</label>
            <input type="text" class="form-control" id="rtsnumber" placeholder="Số nhà" style="max-width:100px;" name="number">
         

        
          <label for="street" style="margin-left:20px;">Tên đường</label>
          <input type="text" class="form-control"  placeholder="Tên đường" style="max-width:150px;" name="street">
       
      
          <label for="street" style="margin-left:20px;">Tên phường</label>
          <input type="text" class="form-control"  placeholder="Tên phường" style="max-width:150px;" name="town">
     
        
          <label for="street" style="margin-left:20px;">Quận</label>
            <input type="text" class="form-control"  placeholder="Tên quận" style="max-width:100px;" name="dist">
      	 </div>
        <div class="form-group" >
          <label for="location" style="font-size: 20px;">Vị trí</label>
          <label for="number"  style="margin-left:20px;" >Latitude</label>
          <input type="text" class="form-control" id="rtsnumber" placeholder="Lat" style="max-width:150px;" name="lat">
          <label for="number" style="margin-left:20px;" >Longtitude</label>
          <input type="text" class="form-control" id="rtsnumber" placeholder="Lng" style="max-width:150px;" name="lng">
        </div>
        
         <hr>
        <div class="form-group" style="width:1400px;"><!-- Images -->
          <label for="" style="font-size:20px;">Hình ảnh quán ăn</label>
       	 <input type="file" name="upfile" accept="image/x-png,image/gif,image/jpeg">
			
          </div><!-- /Btn function -->
        <button type="submit" class="btn btn-primary" style="margin-left:40px;">Thêm</button>
      </form><!-- /Address -->
      <hr>
     
       
      </div>

    </div>
 
<jsp:include page="Layout/_footer.jsp"></jsp:include>