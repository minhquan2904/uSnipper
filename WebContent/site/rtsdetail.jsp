<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<jsp:include page="Layout/_header.jsp"/>
<div class="container" style="min-height:200px;">
	<div class="col-lg-2">
        <div class="row">
           <jsp:include page="Layout/_list-group-editor.jsp"></jsp:include>
        </div>
    </div>
    <div class="col-lg-10" style="padding:20px;">
   		<div class="panel panel-default" >
		  <div class="panel-heading">Chỉnh sửa thông tin món ăn</div>
		  <div class="panel-body">
		  <c:if test="${not empty udscs }">
		  	<p class="scs">Update hình ảnh thành công</p>
		  </c:if> 
		   <c:if test="${not empty oldscs }">
		  	<p class="scs">${oldscs}</p>
		  </c:if> 
		  <font size="12" color="red"><c:if test="${not empty hasDish }">Món ăn đã tồn tại !!!!</c:if>

			</font> 
		  <h2>Quán ăn đang chỉnh sửa: ${rtsname}</h2>	
		  <form action="updateFile.html" method="post" enctype="multipart/form-data">
		  	<img  class="img-rts-avt"  id="imgRts" style="width: 400px; height: 200px;"/>
		  	<br>
		  	 <label>Thay đổi hình ảnh</label>
		  	 <input type="file" name="upfile" accept="image/x-png,image/gif,image/jpeg" id="upfile">
		  	 <input type = "text" name ="file" id="file" hidden>
		  	  <input type = "text" name ="inputDishId" hidden>
		  	  <input type = "text" name ="inputRtsId" value='<c:out value="${rtsid}"></c:out>' hidden >
		  	 <inpput type="number" value="1">
		  	<button type="submit" class="btn btn-danger" disabled="disabled" id="btnchange">Đổi</button>
		  </form>
		  
		  <div class="rating" style="padding:10px;">
		  	<h3>Chỉnh sửa giá tiền</h3>
		  	<input type="number" id="inputNumber">
		  	<button class="btn btn-primary" id="sbtn" disabled="disabled">Lưu</button>
		  	<h5 id="resultmoney"></h5>
		  </div>
		  <div class="table-info">
           <table class="table table-bordered" id="tb1">
             <thead>
               <tr>
               	<th>STT</th>                         
                <th>Mã món ăn</th>
                <th>Tên món ăn</th>  
                <th>Giá tiền</th>
               </tr>
             </thead>
             <tbody>
             		<c:forEach var ="l" items ="${list}" varStatus="loop">
             		 <tr class="clk">
                       <td class="fund">${loop.index +1}</td>     
                       <td>${l.idMonAn }</td>                      
                    <td>${l.dishId.tenMonAn}</td>
                    <td>${l.giaTien}</td>
                    <td hidden="hidden">${l.hinhAnh }</td>
                    <td hidden="hidden">${l.idQuanAn}</td>
                 </tr>
                 </c:forEach>
                
                
             </tbody>
           </table></div>
		</div>
		<div class="panel-footer">
		<label for="rts-id" style="font-size: 25px;">Thêm món ăn mới</label> 
			<form action="addDishToRts.html" method="post"
				enctype="multipart/form-data">
				<label for="rts-id" style="font-size: 15px;">Nhập id</label> <input
					type="text" class="form-control" placeholder="Nhập idMonAn"
					name="idDish" value="" style="margin-top: 5px;">

				<p id="passwordHelpBlock" class="form-text text-muted">Hướng
					dẫn: Điền thông tin tương ứng vào các input. Thông tin các món ăn
					xem table Danh sách món ăn <a href="add-new-dish.html">Tại đây</a>. Nếu món ăn chưa tồn tại, chọn thêm món
					ăn mới trước khi thêm món ăn đó vào quán ăn</p>
				
				<button type="button" class="btn btn-primary" id="abtn">Thêm
					món ăn mới</button> <br/>	
				<label for="rts-describe" style="font-size: 15px;">Nhập mô tả</label>
				<input type="text" class="form-control" placeholder="Nhập mô tả"
					name="describe" value="" style="margin-top: 5px;">
				<label for="rts-price" style="font-size: 15px;">Nhập giá tiền</label>	 
				<input
					type="number" class="form-control ip-mg"
					placeholder="Nhập giá tiền" name="price" value=""
					style="margin-top: 5px;">
				<h3>Hình ảnh món ăn</h3>
				<input type="file" name="pic"
					accept="image/x-png,image/gif,image/jpeg">
				<p id="passwordHelpBlock" class="form-text text-muted">Lưu ý:
					Nếu không có hình ảnh. Hệ thống sẽ tự động chọn hình ảnh mặc định
					cho món ăn</p>
				<input type="text" name="prc" value="old" hidden="hidden" > 
				<input type = "text" name ="inputRtsId" value='<c:out value="${rtsid}"></c:out>' hidden >
				<button type="submit" class="btn btn-primary"
					style="margin-top: 10px;">Tiếp tục</button>

			</form>
		</div>
    	
    
    </div>

</div>
</div> <!--  End container -->
<link rel="stylesheet"
href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css"
type="text/css">
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('#tb1').DataTable();
	
});

$(".clk").click(function()
  {
    var $row = $(this);       // Finds the closest row <tr>
    $tds = $row.find("td");             // Finds all children <td> elements
	
    function processJson1(data)
    {
    	if(data.result == 'success')
    		{
	    		$("#resultmoney").removeClass('fail');
				$('#resultmoney').addClass('scs');
				$('#resultmoney').text("update thành công");
    		}
    }

    $('input[id=inputNumber]').val($tds[3].innerHTML); // lay so tien
    $('input[name=inputDishId]').val($tds[1].innerHTML); // lay id quan an
    // lay id mon an
    $('img[id="imgRts"]').attr("src","images/" + $tds[4].innerHTML);
    $('input[id=file]').val($tds[4].innerHTML);
    $('#sbtn').removeAttr("disabled");
    $('input[name=upfile]').change(function(e){
    	  $("#btnchange").removeAttr('disabled');
    	});
    $('#sbtn').click(function(){
    	var rtsid="${requestScope.rtsid}";
        var money = $("#inputNumber").val();
        var dishid= $tds[1].innerHTML;
        
       
        var dataToSubmit={'rtsid':rtsid,'money':money,'dishid':dishid};
        
        $.ajax({
				url: 'detailRts.html',
				type: 'POST',
				data: dataToSubmit,
				dataType: 'json',
				success: processJson1
			});
        $tds[3].innerHTML=money;
        console.log(dataToSubmit);
    });
    
    
	
  });
</script>
<jsp:include page="Layout/_footer.jsp"/>