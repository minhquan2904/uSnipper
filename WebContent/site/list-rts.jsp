<%@ page pageEncoding="utf-8"%>
<jsp:include page="Layout/_header.jsp"/>
    <div class="container">
      <div class="col-lg-2">
        <div class="row">
          <ul class="list-group" style="position:fixed;">
            <li class="list-group-item" style="disabled;color:white;background-color:#4733b7;">Dành cho quẩn trị viên</li>
            <li class="list-group-item"><a href="addrts-admin.jsp">Thêm quán ăn mới</a></li>
            <li class="list-group-item"><a href="list-dish.jsp">Thêm món ăn mới</a></li>
            <li class="list-group-item"><a href="list-rts.jsp">Quản lý thông tin quán ăn</a></li>
            <li class="list-group-item"><a href="list-mem.jsp">Quản lý tài khoản người dùng</a></li>



          </ul>
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
                      <img src="images/vitamincantho4.jpg" alt="" class="img-rts-avt" />
                      <label for="rts-name" >Vitamin Cần thơ</label>
                    </div>
                  </div><!-- /RTS Avatar -->
                  <div class="col-lg-8">
                    <div class="info"><!-- Each Info -->
                      <form class="form-inline" action="index.jsp" method="post">
                        <fieldset disabled="disabled" id="inputfield">
                          <div class="form-group"  ><!-- ID -->
                            <label for="rts-id">Mã Quán ăn</label>
                            <input type="text" class="form-control" id="inputRtsID" placeholder="#a123" >
                          </div><!-- /ID -->

                          <div class="form-group"><!-- Name -->
                            <label for="rts-name">Tên quán ăn</label>
                            <input type="text" class="form-control" id="inputRtsName" placeholder="Vitamin Cần Thơ" >
                          </div><!-- /Name -->

                          <div class="form-group"><!-- Address -->
                            <label for="rts-address">Địa chỉ</label>
                            <input type="number" class="form-control" id="inputRtsNumber" style="max-width:100px;margin-left: 37px;" value="484" >
                            <select class="street" name="str" style="margin-left: 10px;" id="selectRtsStreet"  >
                              <option>Võ Văn Ngân</option>
                              <option selected="selected">Đặng Văn Bi</option>
                              <option>Kha Vạn Cân</option>
                              <option>Phạm Văn Đồng</option>
                              <option>Xa lộ Hà Nội</option>
                            </select>
                            <select class="street" name="str" style="margin-left: 10px;" >
                              <option selected="Selected">Thủ Đức</option>
                              <option>Bình Thạnh</option>
                              <option>Gò Vấp</option>
                              <option>Quận 2</option>
                              <option>Quận 9</option>
                            </select>

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
                <li><a data-toggle="tab" href="#menu2">Bình Thạnh</a></li>
                <li><a data-toggle="tab" href="#menu3">Gò Vấp</a></li>
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
                        </tr>
                      </thead>
                      <tbody>
                          <tr class="clk">
                            <td class="fund">1</td>
                            <td class='org'>#a123</td>
                            <td>Vitamin Cần thơ</td>
                            <td>484, LVV str, Dist 9 </td>
                          </tr>
                          <tr class="clk">
                            <td class="fund">2</td>
                            <td class='org'>#b699</td>
                            <td>Làng nướng</td>
                            <td>484, LVV str, Dist 9</td>
                          </tr>
                          <tr class="clk">
                            <td class="fund">4</td>
                            <td class='org'>#c456</td>
                            <td>Buffet Hải sản </td>
                            <td>484, LVV str, Dist 9</td>
                          </tr>
                          <tr class="clk">
                            <td class="fund">5</td><td class='org'>#e12322</td>
                            <td>Cơm bình dân</td>
                            <td>484, LVV str, Dist 9</td>
                          </tr>
                      </tbody>
                    </table>
                  </div>
                </div><!-- /Home -->

                <div id="menu1" class="tab-pane fade"><!-- Menu1 -->
                </div><!-- /Menu1 -->

                <div id="menu2" class="tab-pane fade"><!-- Menu2 -->
                </div><!-- /Menu2 -->

                <div id="menu3" class="tab-pane fade"><!-- Menu3 -->
                </div><!-- /Menu3 -->

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


    $row.addClass("active");
    $row.siblings().removeClass("active");
  });

</script>
<jsp:include page="Layout/_footer.jsp"/>