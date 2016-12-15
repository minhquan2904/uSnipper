<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<jsp:include page="Layout/_header.jsp"/>
  <div class="container" style="margin-top:10px;" >
    <div class="col-lg-2" style="margin-top:15px;">
      <jsp:include page="Layout/_list-group-editor.jsp" />
    </div>
    <div class="col-lg-10" >
    	<fieldset disabled="disabled">
    		<h3 style="disabled;color:white;background-color:#4733b7;text-align:center; padding:10px;"><b>Đóng góp thông tin quán ăn</b></h3>
        <form class="form-horizontal" action="hint-rts.html" method="post">
          <div class="form-group">
            <label for="rts-name">Tên quán ăn</label>
            <input name="name-rts" type="text" class="form-control" id="rtsname" placeholder="Nhập tên quán ăn" value='<c:out value="${temp.tenQuanAn }"></c:out>'>
          
          </div>
          <div class="form-group">
            <label for="address">Địa chỉ</label>
            <input name="diachi" type="text" class="form-control" id="rtsaddress" placeholder="Nhập địa chỉ quán ăn" value='<c:out value="${temp.diaChi}"></c:out>'>
          
          </div>
          <div class="form-group">
            <label for="rts-dish">Món ăn</label>
            <textarea name="monan" id="rtsdish" rows="8" cols="140" placeholder="Nhập những món ăn của quán ăn">
            	${temp.monAn}
            </textarea>
          
          </div>
          <div class="form-group">
            <label for="rts-dish">Mô tả</label>
            <textarea  name="mota" id="rtsessay" rows="10" cols="140" placeholder="Nhận xét của bạn về quán ăn">
            	${temp.moTa }
            </textarea>
            
          </div>
         
        </form>
    	</fieldset>
        

    </div>
  </div>

<jsp:include page="Layout/_footer.jsp"/>
