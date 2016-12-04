<%@ page pageEncoding="utf-8"%>
<jsp:include page="Layout/_header.jsp"/>
  <div class="container"><!-- container -->
    <div class="col-lg-2"><!-- List function -->
      <div class="row">
       <jsp:include page="Layout/_list-group-admin.jsp"></jsp:include>
      </div>
    </div><!-- /List function -->

    <div class="col-lg-10" >
      <div class="mn-rts-info">
        <h3 style="disabled;color:white;background-color:#4733b7;text-align:center; padding:10px;"><b>Quản lý tài khoản người dùng</b></h3>
        <div class="row"><!-- Row -->
          <div class="panel panel-default"><!-- Panel info -->
            <div class="panel-body">
                <div class="col-lg-3">
                  <div class="search-box"><!-- search box -->
                    <h4 style="text-align: center">Tìm kiếm</h4>
                      <div class="search-form"><!-- search form -->
                        <form class="form-inline" action="index.jsp" method="post">
                          <div class="form-group">
                            <label for="id">Mã tài khoản</label>
                            <input type="text" class="form-control" id="" placeholder="">
                          </div>
                        </form>
                        <div class="form-group">
                          <label for="name">Tên tài khoản</label>
                          <input type="text" class="form-control" id="" placeholder="">

                        </div>
                      </div><!-- /search form -->
                      <button type="button" name="button" class="btn btn-default">Tìm kiếm</button>
                      <button type="button" name="button" class="btn btn-default" style="float:right;">Làm mới</button>
                  </div><!-- /search box -->
                </div>
                <div class="col-lg-7">
                  <div class="info"><!-- Each Info -->
                    <form class="form-inline" action="index.jsp" method="post">
                      <fieldset disabled="disabled" id="inputfield">
                        <div class="form-group"  ><!-- ID -->
                          <label for="mem-id">Mã Tài khoản</label>
                          <input type="text" class="form-control" id="inputUserID" placeholder="/" >
                        </div><!-- /ID -->

                        <div class="form-group"><!-- Name -->
                          <label for="rts-name">Tên hiển thị</label>
                          <input type="text" class="form-control" id="inputUserName" placeholder="\" >
                        </div><!-- /Name -->


                      </fieldset>



                    </form>
                    <div class="btn-group btn-group-sm"><!-- btn gruop -->
                      <button type="button" name="button" id="btnedit" class="btn btn-default"> <span class="glyphicon glyphicon-pencil"></span>Gửi thông báo</button>
                      <button type="button" name="button" id="btnsave" class="btn btn-default" disabled="disabled"> <span class="glyphicon glyphicon-plus"></span> Xóa</button>
                    </div><!-- /btn gruop -->

                  </div><!-- Each Info -->


                </div>
            </div>
          </div><!-- Panel info -->
        </div><!-- End row -->
        <div class="row">
          <div class="table-info">
            <table class="table table-bordered" id="tb1">
              <thead>
                <tr>
                  <th>STT</th>
                   <th>Mã Tài khoản</th>
                   <th>Tên hiển thị</th>
                </tr>
              </thead>
              <tbody>
                  <tr class="clk">
                    <td class="fund">1</td>
                    <td class='org'>#a123</td>
                    <td>Trần Văn A</td>

                  </tr>

              </tbody>
            </table>
          </div>

        </div>
      </div>

    </div>
  </div><!-- container -->

<jsp:include page="Layout/_footer.jsp"/>
