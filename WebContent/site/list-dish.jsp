<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<jsp:include page="Layout/_header.jsp"></jsp:include>
  <div class="container"><!-- container -->
    <div class="col-lg-2"><!-- List function -->
      <div class="row">
         <jsp:include page="Layout/_list-group-editor.jsp"></jsp:include>
      </div>
    </div><!-- /List function -->
    <div class="col-lg-10">
      <div class="dish-table"><!-- dish area -->
        <div class="panel panel-default"><!-- panel add dish -->
          <div class="panel-heading">
            <h3 class="panel-title">Quản lý món ăn</h3>
          </div>
          <div class="panel-body">
            <div class="new-dish"><!-- edit -->
              <font size="12" color="red"><c:if test="${not empty hasD }">Món ăn đã tồn tại !!!!</c:if>
		    	<c:if test="${not empty scs}">Thêm thành công</c:if></font>
		      <form action="add-new-dish.html" class="form-inline" method="post">
		    	  <h3 class="panel-title">Thêm món ăn mới</h3>
		      	<div class="form-group">
				    <label for="email">Tên món ăn</label>
				    <input type="text" class="form-control" id="email" name="dname">
		  		</div>
		  			
		  		<button type="submit" class="btn btn-primary" style="margin-top:10px;" >Thêm</button>
		  		
		      </form><!--  Update form -->
				 <div class="edit-dish"><!-- edit -->
               <form class="form-inline" action="updateDish.html" method="post">
                <h3 class="panel-title">Chỉnh sửa món ăn </h3>
                  <div class="form-group">
                    <label for="Id">Mã món ăn</label>
                    <input type="text" class="form-control" id="input-dish-id"  readonly  name="idD">
                  </div>
                  <div class="form-group">
                    <label for="dish-name">Tên món ăn</label>
                    <input type="text" class="form-control" id="input-dish-name" disabled="disabled"  name="nameD">
                  </div>
                  <button type="button" class="btn btn-default" id="btnedit" style="margin:0;">
                    Chỉnh sửa
                  </button>
                  <button type="submit" class="btn btn-default" id="btnsave" style="margin:0;" disabled="disabled">
                    Lưu
                  </button>
                  <button type="button" class="btn btn-default" id="btndelete" style="margin:0;" >
                    Xóa
                  </button>

                </form><!-- /update -->
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
                      <td>Mô tả </td>
                    </tr>
                  </thead><!-- /T head -->
                  <tbody>
                    <c:forEach var="l" items="${list}" varStatus="loop">
	     				<tr class="clk">
	     					<td>${loop.index +1}</td>
	     					<td>${l.id}</td>
	     					<td>${l.tenMonAn}</td>
	     					
	     				</tr>
     				</c:forEach>
                    
                  </tbody>
                </table>
              </div>
          </div><!--/ Dish-Table -->
          <div class="panel-footer"><!-- panel footer -->
             

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