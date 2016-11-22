<%@ page pageEncoding="utf-8"%>
<jsp:include page="Layout/_header.jsp"/>
  <div class="container" style="margin-top:10px;" >
    <div class="col-lg-2" style="margin-top:15px;">
      <ul class="list-group" style="position:fixed;">
        <li class="list-group-item" style="disabled;color:white;background-color:#4733b7;">Dành cho đọc giả</li>
        <li class="list-group-item"><a href="profileView.jsp"><span class="glyphicon glyphicon-arrow-left"></span> Quay lại</a></li>
        <li class="list-group-item"><a href="#">Đóng góp quán ăn khác</a></li>
      </ul>
    </div>
    <div class="col-lg-10" >
        <h3 style="disabled;color:white;background-color:#4733b7;text-align:center; padding:10px;"><b>Đóng góp thông tin quán ăn</b></h3>
        <form class="form-horizontal" action="hint-rts.html" method="post">
          <div class="form-group">
            <label for="rts-name">Tên quán ăn</label>
            <input name="name-rts" type="text" class="form-control" id="rtsname" placeholder="Nhập tên quán ăn">
            <p class="help-block"><i>Vui lòng nhập tên quán ăn</i></p>
          </div>
          <div class="form-group">
            <label for="address">Địa chỉ</label>
            <input name="diachi" type="text" class="form-control" id="rtsaddress" placeholder="Nhập địa chỉ quán ăn">
            <p class="help-block"><i>Vui lòng nhập địa chỉ quán ăn</i></p>
          </div>
          <div class="form-group">
            <label for="rts-dish">Món ăn</label>
            <textarea name="monan" id="rtsdish" rows="8" cols="140" placeholder="Nhập những món ăn của quán ăn"></textarea>
            <p class="help-block"><i>Không bắt buộc</i></p>
          </div>
          <div class="form-group">
            <label for="rts-dish">Mô tả</label>
            <textarea  name="mota" id="rtsessay" rows="10" cols="140" placeholder="Nhận xét của bạn về quán ăn"></textarea>
            <p class="help-block"><i>Không bắt buộc</i></p>
          </div>
          <button type="submit" class="btn btn-default" value="hint" name="command" style="float:right;margin-right: 70px;">Gửi</button>
        </form>

    </div>
  </div>

<jsp:include page="Layout/_footer.jsp"/>
