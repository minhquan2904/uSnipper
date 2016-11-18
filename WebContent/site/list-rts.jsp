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
                  <div class="col-lg-2"><!-- RTS Avatar -->
                    <div class="rts-avt">
                      <img src="" alt="" class="img-rts-avt"  id="imgRts"/>
                      
                    </div>
                  </div><!-- /RTS Avatar -->
                  <div class="col-lg-8">
                    <div class="info"><!-- Each Info -->
                      <form class="form-inline" action="index.jsp" method="post">
                        <fieldset id="inputfield">
                          <div class="form-group"  ><!-- ID -->
                            <label for="rts-id">Mã Quán ăn</label>
                            <input type="text" class="form-control" id="inputRtsID" placeholder="" readonly="readonly" style="margin-left: 5px;">
                          </div><!-- /ID -->

                          <div class="form-group"><!-- Name -->
                            <label for="rts-name">Tên quán ăn</label>
                            <input type="text" class="form-control" id="inputRtsName" placeholder="" readonly="readonly">
                          </div><!-- /Name -->

                          <div class="form-group"><!-- Address -->
                            <label for="rts-address">Địa chỉ</label>
                           <input type="text" class="form-control" id="inputRtsAddress" placeholder="" readonly="readonly" style="margin-left: 40px;">

                          </div><!-- /Address -->
                        </fieldset>



                      </form>
                      <div class="btn-group btn-group-sm"><!-- btn gruop -->
                        <a href="#" class="btn btn-default" id="btndetail"><span class="glyphicon glyphicon-th-list"></span> Chi tiết</a>
                        <button type="button" name="button" id="btnedit" class="btn btn-default"> <span class="glyphicon glyphicon-pencil"></span> Chỉnh sửa</button>
                        <button type="button" name="button" id="btnsave" class="btn btn-default" disabled="disabled"> <span class="glyphicon glyphicon-plus"></span> Lưu</button>
                      </div><!-- /btn gruop -->

                    </div><!-- /Each Info -->


                  </div>
              </div>
            </div><!-- /Panel info -->
          </div><!-- End row -->
          <div class="row">
            <div class="tab-info"><!-- tab -->
              <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#home">Thủ Đức</a></li>
                <li><a data-toggle="tab" href="#menu1">Quận 9</a></li>
                
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
                             Địa chỉ
                           </th>
                           <th> Lượt tra cứu </th>
                           <th> Ngày thêm</th>
                            <th hidden="hidden"></th>
                        </tr>
                      </thead>
                      <tbody>
                      		<c:forEach var ="l" items ="${listTD }" varStatus="loop">
                      		 <tr class="clk">
                                <td class="fund">${loop.index +1}</td>     
                                <td>${l.id }</td>                      
	                            <td>${l.tenQuanAn}</td>
	                            <td>${l.soNha } , ${l.tenDuong },${l.tenPhuong } </td>
	                            <td>${l.luotTraCuu }</td>
	                            <td>${l.ngayThem }</td>
	                             <td hidden="hidden">${l.hinhAnh }</td>
                          </tr>
                          </c:forEach>
                         
                         
                      </tbody>
                    </table>
                  </div>
                </div><!-- /Home -->

                <div id="menu1" class="tab-pane fade"><!-- Menu1 -->
                 <div class="table-info">
                    <table class="table table-bordered" id="tb1">
                      <thead>
                        <tr>
                        	<th>STT</th>                         
                           <th>Mã quán</th>
                           <th>Tên quán</th>
                           <th>
                             Địa chỉ
                           </th>
                           <th> Lượt tra cứu </th>
                           <th> Ngày thêm</th>
                           <th hidden="hidden"></th>
                        </tr>
                      </thead>
                      <tbody>
                      		<c:forEach var ="l" items ="${listQ9 }" varStatus="loop">
                      		 <tr class="clk">
                                <td class="fund">${loop.index +1}</td>     
                                <td>${l.id }</td>                      
	                            <td>${l.tenQuanAn}</td>
	                            <td>${l.soNha } , ${l.tenDuong },${l.tenPhuong } </td>
	                            <td>${l.luotTraCuu }</td>
	                            <td>${l.ngayThem }</td>
	                            <td hidden="hidden">${l.hinhAnh }</td>
                          </tr>
                          </c:forEach>
                         
                         
                      </tbody>
                    </table>
                  </div>
                </div><!-- /Menu1 -->

                

            </div><!-- /Content -->

          </div>
        </div>

      </div>
    </div>
 <script type="text/javascript">
  function change()
  {
    var btnsave = document.getElementById("btnsave");
    btnsave.removeAttribute("disabled");

    var btnedit = document.getElementById("btnedit");
    btnedit.setAttribute("disabled","disabled");

    var field = document.getElementById("inputfield");
    field.removeAttribute("disabled");


  }
  function save()
  {
    var btnsave = document.getElementById("btnsave");
    btnsave.setAttribute("disabled","disabled");

    var btnedit = document.getElementById("btnedit");
    btnedit.removeAttribute("disabled");

    var field = document.getElementById("inputfield");
    field.setAttribute("disabled","disabled");

  }



    $("#btnedit").click(function()
      {
        change();
      }
    );

    $("#btnsave").click(function()
    {
      save();
    });


  $(".clk").click(function()
  {
    var $row = $(this);       // Finds the closest row <tr>
    $tds = $row.find("td");             // Finds all children <td> elements


    $('input[id=inputRtsID]').val($tds[1].innerHTML);
    $('input[id=inputRtsName]').val($tds[2].innerHTML);
    $('input[id=inputRtsAddress]').val($tds[3].innerHTML);
	$('img[id="imgRts"]').attr("src","images/" + $tds[6].innerHTML);

    $row.addClass("active");
    $row.siblings().removeClass("active");
  });

</script>
<jsp:include page="Layout/_footer.jsp"/>