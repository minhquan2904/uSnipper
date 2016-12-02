<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<jsp:include page="Layout/_header.jsp"/>
    <div class="container">
      <div class="col-lg-2">
        <div class="row">
           <jsp:include page="Layout/_list-group-editor.jsp"></jsp:include>
        </div>
      </div>
      <div class="col-lg-10" >
        <div class="mn-rts-info">
          <h3 style="disabled;color:white;background-color:#4733b7;text-align:center; padding:10px;"><b>Quản lý thông tin quán ăn</b></h3>
          <div class="row"><!-- Row -->
            <div class="panel panel-default"><!-- Panel info -->
              <div class="panel-body">
                  <div class="col-lg-4"><!-- RTS Avatar -->
                    <div class="rts-avt">
                      <img src="" alt="" class="img-rts-avt"  id="imgRts" style="width: 400px; height: 200px;"/>
                      
                    </div>
                  </div><!-- /RTS Avatar -->
                  <div class="col-lg-6">
                  <font size="12" color="green">
                  	<c:if test="${not empty success }">Chỉnh sửa thành công</c:if>
                  </font>
                    <div class="info"><!-- Each Info -->
                      <form class="form-inline" action="listRestaurant.html" method="post">
                        <fieldset id="inputfield" style="    width: 800px;">
                          <div class="form-group" style="margin-left: 0px;"  ><!-- ID -->
                            <label for="rts-id">Mã Quán ăn</label>
                            <input type="text" class="form-control" id="inputRtsID" placeholder="" readonly="readonly" style="margin-left: 15px;" name="id">
                          </div><!-- /ID -->

                          <div class="form-group" style="margin-left: 0px;" ><!-- Name -->
                            <label for="rts-name">Tên quán ăn</label>
                            <input type="text" class="form-control" id="inputRtsName" placeholder="" readonly="readonly" name="tenQuanAn">
                          </div><!-- /Name -->

                          <div class="form-group" style="margin-left: 0px;" ><!-- Address -->
                            <label for="rts-address">Số nhà</label>
                           <input type="text" class="form-control" id="inputRtsNumber" placeholder="" readonly="readonly" style="margin-left: 50px;" name="soNha">

                          </div><!-- /Address -->
                          
                          <div class="form-group" style="margin-left: 0px;" ><!-- Address -->
                            <label for="rts-address">Đường</label>
                           <input type="text" class="form-control" id="inputRtsStreet" placeholder="" readonly="readonly" style="margin-left: 40px;" name="tenDuong">

                          </div><!-- /Address -->
                           <div class="form-group" style="margin-left: 0px;" ><!-- Address -->
                            <label for="rts-address">Phường</label>
                           <input type="text" class="form-control" id="inputRtsTown" placeholder="" readonly="readonly" style="margin-left: 45px;" name="tenPhuong">

                          </div><!-- /Address -->
                          <div class="form-group" style="margin-left: 0px;" ><!-- Describe -->
                            <label for="rts-name">Mô tả</label>
                           <input type="text" class="form-control" id="inputRtsDes" placeholder="" readonly="readonly" style="margin-left: 50px;" name="moTa">

                          </div><!-- /Address -->
                          
                           <div class="form-group" style="margin-left: 0px;" ><!-- Famous -->
                            <label for="rts-name">Món nổi tiếng</label>
                           <input type="text" class="form-control" id="inputRtsFas" placeholder="" readonly="readonly" style="margin-left: 5px;" name="monNoiTieng">

                          </div><!-- /Address -->
                        </fieldset>
						 <div class="btn-group btn-group-sm" style="width:800px;"><!-- btn gruop -->
						<button type="button" class="btn btn-default" id="btncmt"><span class="glyphicon glyphicon-th-list"></span> Duyệt bình luận</button>
                        <button type="button" class="btn btn-default" id="btndetail"><span class="glyphicon glyphicon-th-list"></span> Chi tiết món ăn</button>
                        <button type="button" name="button" id="btnedit" class="btn btn-default"> <span class="glyphicon glyphicon-pencil"></span> Chỉnh sửa</button>
                        <button type="submit" name="button" id="btnsave" class="btn btn-default" disabled="disabled"> <span class="glyphicon glyphicon-plus"></span> Lưu</button>
                        
                       
                      </div><!-- /btn gruop -->


                      </form>
                     

                    </div><!-- /Each Info -->


                  </div>
              </div>
            </div><!-- /Panel info -->
          </div><!-- End row -->
          <div class="row">
            <div class="tab-info"><!-- tab -->
              <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#home">Chính</a></li>
                <li><a data-toggle="tab" href="#menu1">Quận 9</a></li>
                <li><a data-toggle="tab" href="#menu2">Thủ Đức</a></li>
                
              </ul>
            </div><!-- /tab -->
            <div class="tab-content"><!-- Content -->
              	<div id="home" class="tab-pane fade in active"><!-- Home -->
                  <div class="table-info">
                    <table class="table table-bordered" id="tb1">
                      <thead>
                        <tr>
                        	<th>STT</th>                         
                           <th>Mã quán</th>
                           <th>Tên quán</th>
                           <th>
                             Số nhà
                           </th>
                           <th>Đường</th>
                           <th>Phường</th>
                           <th> Lượt tra cứu </th>
                           <th> Ngày thêm</th>
                           <th>Mô tả </th>
                            <th>Món nổi tiếng</th>
                            <th hidden="hidden"></th>
                        </tr>
                      </thead>
                      <tbody>
                      		<c:forEach var ="l" items ="${list}" varStatus="loop">
                      		 <tr class="clk">
                                <td class="fund">${loop.index +1}</td>     
                                <td>${l.id }</td>                      
	                            <td>${l.tenQuanAn}</td>
	                            <td>${l.soNha }</td>
	                            <td>${l.tenDuong } </td>
	                            <td>${l.tenPhuong }</td>
	                            <td>${l.luotTraCuu }</td>
	                            <td>${l.ngayThem }</td>
	                            <td>${l.moTa }</td>
	                             <td>${l.monNoiTieng }</td>
	                             <td hidden="hidden">${l.hinhAnh }</td>
                          </tr>
                          </c:forEach>
                         
                         
                      </tbody>
                    </table>
                  </div>
                </div><!-- /Home -->

                <div id="menu1" class="tab-pane fade"><!-- Menu1 -->
                 <div class="table-info">
                    <table class="table table-bordered" id="tb2">
                      <thead>
                        <tr>
                        	<th>STT</th>                         
                           <th>Mã quán</th>
                           <th>Tên quán</th>
                           <th>
                             Số nhà
                           </th>
                           <th>Đường</th>
                           <th>Phường</th>
                           <th> Lượt tra cứu </th>
                           <th> Ngày thêm</th>
                           <th>Mô tả </th>
                           <th>Món nổi tiếng</th>
                           <th hidden="hidden"></th>
                        </tr>
                      </thead>
                      <tbody>
                      		<c:forEach var ="l" items ="${listQ9 }" varStatus="loop">
                      		 <tr class="clk">
                                <td class="fund">${loop.index +1}</td>     
                                <td>${l.id }</td>                      
	                            <td>${l.tenQuanAn}</td>
	                            <td>${l.soNha }</td>
	                            <td>${l.tenDuong } </td>
	                            <td>${l.tenPhuong }</td>
	                            <td>${l.luotTraCuu }</td>
	                            <td>${l.ngayThem }</td>
	                             <td>${l.moTa }</td>
	                             <td>${l.monNoiTieng }</td>
	                            <td hidden="hidden">${l.hinhAnh }</td>
                          </tr>
                          </c:forEach>
                         
                         
                      </tbody>
                    </table>
                  </div>
                </div><!-- /Menu1 -->

                <div id="menu2" class="tab-pane fade"><!-- Menu2 -->
                 <div class="table-info">
                    <table class="table table-bordered" id="tb3">
                      <thead>
                        <tr>
                        	<th>STT</th>                         
                           <th>Mã quán</th>
                           <th>Tên quán</th>
                           <th>
                             Số nhà
                           </th>
                           <th>Đường</th>
                           <th>Phường</th>
                           <th> Lượt tra cứu </th>
                           <th> Ngày thêm</th>
                           <th>Mô tả </th>
                           <th>Món nổi tiếng</th>
                           <th hidden="hidden"></th>
                        </tr>
                      </thead>
                      <tbody>
                      		<c:forEach var ="l" items ="${listTD }" varStatus="loop">
                      		 <tr class="clk">
                                <td class="fund">${loop.index +1}</td>     
                                <td>${l.id }</td>                      
	                            <td>${l.tenQuanAn}</td>
	                            <td>${l.soNha }</td>
	                            <td>${l.tenDuong } </td>
	                            <td>${l.tenPhuong }</td>
	                            <td>${l.luotTraCuu }</td>
	                            <td>${l.ngayThem }</td>
	                             <td>${l.moTa }</td>
	                             <td>${l.monNoiTieng }</td>
	                            <td hidden="hidden">${l.hinhAnh }</td>
                          </tr>
                          </c:forEach>
                         
                         
                      </tbody>
                    </table>
                  </div>
                </div><!-- /Menu2 -->

            </div><!-- /Content -->

          </div>
        </div>

      </div>
   </div>
 <link rel="stylesheet"
href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css"
type="text/css">
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>

 <script type="text/javascript">
  function change()
  {
    var btnsave = document.getElementById("btnsave");
    btnsave.removeAttribute("disabled");

    var btnedit = document.getElementById("btnedit");
    btnedit.setAttribute("disabled","disabled");

    var inputRtsName = document.getElementById("inputRtsName");
    inputRtsName.removeAttribute("readonly");

    var inputRtsNumber = document.getElementById("inputRtsNumber");
    inputRtsNumber.removeAttribute("readonly");
    
    var inputRtsStreet = document.getElementById("inputRtsStreet");
    inputRtsStreet.removeAttribute("readonly");
    
    var inputRtsTown = document.getElementById("inputRtsTown");
    inputRtsTown.removeAttribute("readonly");
    
    var inputRtsDes = document.getElementById("inputRtsDes");
    inputRtsDes.removeAttribute("readonly");
   
    var inputRtsFas = document.getElementById("inputRtsFas");
    inputRtsFas.removeAttribute("readonly");
  }
 

  $(document).ready(function() {
		$('#tb1').DataTable();
		$('#tb2').DataTable();
		$('#tb3').DataTable();
	});

    $("#btnedit").click(function()
      {
        change();
        $("table#tb1 :text").prop("disabled", true);
      }
    );

   

  $(".clk").click(function()
  {
    var $row = $(this);       // Finds the closest row <tr>
    $tds = $row.find("td");             // Finds all children <td> elements


    $('input[id=inputRtsID]').val($tds[1].innerHTML);
    $('input[id=inputRtsName]').val($tds[2].innerHTML);
    $('input[id=inputRtsNumber]').val($tds[3].innerHTML);
    $('input[id=inputRtsStreet]').val($tds[4].innerHTML);
    $('input[id=inputRtsTown]').val($tds[5].innerHTML);
    $('input[id=inputRtsDes]').val($tds[8].innerHTML);
    $('input[id=inputRtsFas]').val($tds[9].innerHTML);
	$('img[id="imgRts"]').attr("src","images/" + $tds[10].innerHTML);

    $row.addClass("active");
    $row.siblings().removeClass("active");
    
    $("#inputfield").find("input").attr("readonly", "readonly");
    $("#btnedit").removeAttr("disabled");
    $("#btnsave").attr("disabled",true);
    
	$("#btndetail").click(function(){
		var id = $tds[1].innerHTML;
		
		window.location.href="detailRts.html?id="+id;
	});
	
	$("#btncmt").click(function(){
		var id = $tds[1].innerHTML;
		
		window.location.href="list-comment.html?id="+id;
	});
  });

</script>
<jsp:include page="Layout/_footer.jsp"/>