<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="Layout/_header.jsp"/>

  <div class="container">
    <div class="col-lg-2"><!-- List function -->
      <div class="row">
        <ul class="list-group" style="position:fixed;">
          <li class="list-group-item" style="disabled;color:white;background-color:#4733b7;">Dành cho Admin</li>
          <li class="list-group-item"><a href="add-editor.jsp">Thêm tài khoản mới</a></li>
          <li class="list-group-item"><a href="list-editor.jsp">Quản lý tài khoản quản trị viên</a></li>
        </ul>
      </div>
    </div><!-- /List function -->
    <div class="col-lg-10" >
      <div class="add-editor">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title">Thêm tài khoản mới</h3>
          </div>
          <div class="panel-body">
            <div class="add-editor">
              <form class="form-horizontal" action="index.jsp" method="post">
                <div class="form-group">
                  <label for="username">Tên tài khoản</label>
                  <input type="text" class="form-control" id="" placeholder="Tên tài khoản">
                  <p class="help-block">Tên tài khoản không được vi phạm tiêu chuẩn cộng đồng</p>
                </div>
                <div class="form-group">
                  <label for="password">Mật khẩu</label>
                  <input type="text" class="form-control" id="" placeholder="Mật khẩu">
                  <p class="help-block">Mật khẩu mặc định (khuyến khích): Aa123456</p>
                </div>
              </form>
            </div>

          </div>
          <div class="panel-footer">
              <button type="button" class="btn btn-default" id="btncheck" style="margin-left:40px;">
                Kiểm tra
              </button>
              <button type="button" class="btn btn-default" disabled="disabled">
                Lưu
              </button>
          </div>
        </div>
      </div>

    </div>

  </div>
<jsp:include page="Layout/_footer.jsp"/>
