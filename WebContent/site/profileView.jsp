<%@ page pageEncoding="utf-8"%>
<jsp:include page="Layout/_header.jsp"/>
 <div class="container">
    <div class="col-lg-2"><!-- List function -->
      <div class="row">
        <jsp:include page="Layout/_list-group-viewer.jsp"></jsp:include>
      </div>
    </div><!-- /List function -->
    <div class="col-lg-10" >
        <div class="row" style="margin-top:20px;"><!-- profile info -->
          <div class="panel panel-default" style="margin-left:10px;"><!-- Panel -->
            <div class="panel-heading">
              <h3 class="panel-title">Thông tin cá nhân</h3>
            </div>
            <div class="panel-body">
              <div class="col-lg-3">
                  <div class="avt"><!-- avt -->
                    <img src="images/${user.hinhAnh}" alt=""  />
                  </div><!-- avt -->
              </div>
              <div class="col-lg-7">
                <fieldset>
                  <form class="form-inline" action="index.jsp" method="post">

                    <div class="form-group" style="width:400px; margin-top:20px;"><!-- name -->
                      <label for="name">Họ và tên</label>
                      <input type="text" class="form-control" id="emp-name" placeholder="" value="${user.userName}" style="margin-left: 48px;">
                    </div><!-- name -->

                    <div class="form-group" style="width:400px; margin-top:20px;"><!-- date  -->
                      <label for="name">Ngày tham gia</label>
                      <input type="text" class="form-control" id="emp-name" placeholder="" value="${user.ngayDangKy}" style="margin-left: 15px;">
                    </div><!-- name -->

                  </form>
                </fieldset>
              </div>

            </div>
            <div class="panel-footer">

            </div>
          </div><!-- /Panel -->

        </div><!-- /profile info -->
    </div>

  </div>

<jsp:include page="Layout/_footer.jsp"/>
