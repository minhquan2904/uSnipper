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
		  <div class="panel-heading">Panel Heading</div>
		  <div class="panel-body"> 	
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
                   
                 </tr>
                 </c:forEach>
                
                
             </tbody>
           </table></div>
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

    $('input[id=inputNumber]').val($tds[3].innerHTML);
   	
    $('#sbtn').removeAttr("disabled");
    
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