<%@ page pageEncoding="utf-8"%>
<jsp:include page="Layout/_header.jsp"></jsp:include>
  <div class="container"><!-- container -->
    <div class="col-lg-2"><!-- List function -->
      <div class="row">
        <ul class="list-group" style="position:fixed;">
          <li class="list-group-item" style="disabled;color:white;background-color:#4733b7;">Dành cho quẩn trị viên</li>
          <li class="list-group-item"><a href="addrts-admin.jsp">Thêm quán ăn mới</a></li>
          <li class="list-group-item"><a href="list-dish.jsp">Thêm món ăn mới</a></li>
          <li class="list-group-item"><a href="list-rts.jsp">Quản lý thông tin quán ăn</a></li>
          <li class="list-group-item"><a href="list-mem.jsp">Quản lý tài khoản người dùng</a></li>



        </ul>
      </div>
    </div><!-- /List function -->
    <div class="col-lg-10">
      <div class="dish-table"><!-- dish area -->
        <div class="panel panel-default"><!-- panel add dish -->
          <div class="panel-heading">
            <h3 class="panel-title">Thêm món ăn mới</h3>
          </div>
          <div class="panel-body">
            <div class="new-dish"><!-- edit -->
              <form class="form-inline" action="index.jsp" method="post">
                <div class="form-group">
                  <label for="Id">Mã món ăn</label>
                  <input type="text" class="form-control" id="new-dish-id">
                </div>
                <div class="form-group">
                  <label for="dish-name">Tên món ăn</label>
                  <input type="text" class="form-control" id="new-dish-name">
                </div>
                <button type="button" class="btn btn-default" id="btncheck" style="margin:0;">
                  Kiểm tra
                </button>
                <button type="button" class="btn btn-default" id="btnnewsave" style="margin:0;" disabled="disabled">
                  Lưu
                </button>


              </form>

            </div><!-- /edit -->
          </div>
        </div><!-- /panel add dish -->
        <div class="panel panel-default">
          <div class="panel-heading"><!-- panel heading -->
            <h3 class="panel-title">Danh sách món ăn</h3>
          </div><!-- /panel heading -->
          <div class="panel-body"><!-- Dish-Table -->
              <div class="table-info">
                <table class="table table-bordered">
                  <thead><!-- T head -->
                    <tr>
                      <td>STT</td>
                      <td>Mã số món ăn</td>
                      <td>Tên món ăn</td>
                    </tr>
                  </thead><!-- /T head -->
                  <tbody>
                    <tr class="clk">
                      <td>1</td>
                      <td>001</td>
                      <td>Cơm gà</td>
                    </tr>
                    <tr class="clk">
                      <td>2</td>
                      <td>002</td>
                      <td>Cơm bò xào</td>
                    </tr>
                    <tr class="clk">
                      <td>3</td>
                      <td>003</td>
                      <td>Cơm tấm</td>
                    </tr>
                    <tr class="clk">
                      <td>4</td>
                      <td>004</td>
                      <td>Cơm chay</td>
                    </tr>
                  </tbody>
                </table>
              </div>
          </div><!--/ Dish-Table -->
          <div class="panel-footer"><!-- panel footer -->
              <div class="edit-dish"><!-- edit -->
                <form class="form-inline" action="index.jsp" method="post">
                  <div class="form-group">
                    <label for="Id">Mã món ăn</label>
                    <input type="text" class="form-control" id="input-dish-id" value = "001" disabled="disabled">
                  </div>
                  <div class="form-group">
                    <label for="dish-name">Tên món ăn</label>
                    <input type="text" class="form-control" id="input-dish-name" value="Cơm gà" disabled="disabled" >
                  </div>
                  <button type="button" class="btn btn-default" id="btnedit" style="margin:0;">
                    Chỉnh sửa
                  </button>
                  <button type="button" class="btn btn-default" id="btnsave" style="margin:0;" disabled="disabled">
                    Lưu
                  </button>
                  <button type="button" class="btn btn-default" id="btndelete" style="margin:0;" >
                    Xóa
                  </button>

                </form>

              </div><!-- /edit -->

          </div><!--/ panel footer -->
        </div>
      </div><!-- /dish area -->
    </div>
  </div><!-- /container -->
 <script type="text/javascript">
function change()
{
  var btnsave = document.getElementById("btnsave");
  btnsave.removeAttribute("disabled");

  var btnedit = document.getElementById("btnedit");
  btnedit.setAttribute("disabled","disabled");

  var inputId = document.getElementById("input-dish-id");
  inputId.removeAttribute("disabled");

  var inputName = document.getElementById("input-dish-name");
  inputName.removeAttribute("disabled");
}

function save()
{
  var btnsave = document.getElementById("btnsave");
  btnsave.setAttribute("disabled","disabled");

  var btnedit = document.getElementById("btnedit");
  btnedit.removeAttribute("disabled");

  var inputId = document.getElementById("input-dish-id");
  inputId.setAttribute("disabled","disabled");

  var inputName = document.getElementById("input-dish-name");
  inputName.setAttribute("disabled","disabled");

}
$("#btnedit").click(function()
  {
    change();

  }
);
$("#btnsave").click(function(){
  save();
});
$(".clk").click(function()
{
  var $row = $(this);       // Finds the closest row <tr>
  $tds = $row.find("td");             // Finds all children <td> elements


  $('input[id=input-dish-id]').val($tds[1].innerHTML);
  $('input[id=input-dish-name]').val($tds[2].innerHTML);


  $row.addClass("active");
  $row.siblings().removeClass("active");
});
</script>
<jsp:include page="Layout/_footer.jsp"></jsp:include>