<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<jsp:include page="Layout/_header.jsp" />
<div class="container"
	style="background-color: #F5F5F5; min-height: 400px;">
	<div class="col-lg-2">
		<div class="row">
			<jsp:include page="Layout/_list-group-editor.jsp" />
		</div>
	</div>
	<div class="col-lg-10"
		style="margin-top: 10px; margin-left: 60px; max-width: 1000px;">
		<div class="tab-info">
			<!-- tab info -->
			<ul class="nav nav-tabs">
				<!-- tab -->
				<li class="active"><a data-toggle="tab" href="#home">Bình
						luận chưa duyệt</a></li>
				<li><a data-toggle="tab" href="#menu1">Bình luận đã duyệt</a></li>
			</ul>
			<!-- /tab -->
		</div>
		<!-- /tab info -->
		<div class="tab-content">
			<!-- Content -->
			<div id="home" class="tab-pane fade in active">
				<!-- Home -->
				<div class="cmt-item active">
					<c:if test="${not empty listWait }">
						<c:forEach var="l" items="${listWait}">
							<div class="row"
								style="background-color: white; padding: 10px; margin-bottom: 10px; margin-top: 10px;">
								<!-- Row -->
								<div class="avt-info">
									<div style="width: 55px; float: left;">
										<img src="images/${l.user.hinhAnh }" alt=""
											class="img-responsive" />
									</div>
									<div class="account-info"
										style="width: 500px; float: left; margin-top: 10px; margin-left: 25px;">
										<a href="" class="member"><span class="member-name">${l.user.tenNguoiDung }</span></a>
									</div>
									<div style="width: 500px;">
										<p>
											<i class="fa fa-comments-o cmt-time"></i> <span
												class="cmt-time">${l.ngayThem }</span>
										</p>

									</div>



								</div>
								<div class="comment" style="margin-top: 40px;">


									<p>${l.noiDung}</p>
									<h4 class="fail" id="resutl${l.id}"></h4>
									<div class="list-btn">

										<button class="btn btn-success" name="btnallow">Cho
											phép</button>
										<a class="btn btn-danger btn-minier" href="#edit-modal" role="button" data-toggle="modal" data-id="${l.id}"><i class="icon-edit bigger-120"></i>Xóa</a> &nbsp;
										<input name="id" value="${l.id}" hidden="hidden" />

									</div>
								</div>
							</div>
							<!-- End Row -->
						</c:forEach>

					</c:if>


				</div>
			</div>
			<!-- /Home -->

			<div id="menu1" class="tab-pane fade">
				<!-- Menu1 -->
				<div class="table-info">
					<c:if test="${not empty listOK }">
						<c:forEach var="l" items="${listOK}">
							<div class="row"
								style="background-color: white; padding: 10px; margin-bottom: 10px; margin-top: 10px;">
								<!-- Row -->
								<div class="avt-info">
									<div style="width: 55px; float: left;">
										<img src="images/${l.user.hinhAnh }" alt=""
											class="img-responsive" />
									</div>
									<div class="account-info"
										style="width: 500px; float: left; margin-top: 10px; margin-left: 25px;">
										<a href="" class="member"><span class="member-name">${l.user.tenNguoiDung }</span></a>
									</div>
									<div style="width: 500px;">
										<p>
											<i class="fa fa-comments-o cmt-time"></i> <span
												class="cmt-time">${l.ngayThem }</span>
										</p>

									</div>



								</div>
								<div class="comment" style="margin-top: 40px;">
									<p>${l.noiDung}</p>

									<h4 class="fail" id="resutl${l.id}"></h4>
									<div class="list-btn">

										<button class="btn btn-warning" name="btnwait">Chờ
											duyệt</button>
										
										<input name="id" value="${l.id}" hidden="hidden" />

									</div>
								</div>
							</div>
							<!-- End Row -->
						</c:forEach>

					</c:if>
				</div>
			</div>
			<!-- /Menu1 -->



		</div>
		<!-- /Content -->

	</div>
	<div id="edit-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Xác nhận</h4>
            </div>
            <div class="modal-body edit-content">
                Bình luận đã xóa không thể phục hồi. Bạn xác định xóa bình luận này?
                <p id="deleteresult" class="fail"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="close">Thoát</button>
                <button type="button" class="btn btn-danger btn-ok" id="ok">Xóa</button>
            </div>
        </div>
    </div>
</div>
</div>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				function processJsonCmt(data) {
					if (data.result == "success") {
						var x = data.id;
						
						$('#resutl' + x).removeClass('fail');
						$("#resutl" + x).addClass('scs');
						$("#resutl" + x).text("Đã chỉnh sửa trạng thái");
						
					}
				};
				function processJsonDelete(data) {
					if (data.result == "success") {

						$('#deleteresult').removeClass('fail');
						$("#deleteresult").addClass('delete');
						$("#deleteresult").text("Đã xóa bình luận này. Nhấn thoát để quay lại trang quản lý bình luận");
					}
					else
						{
							$('#deleteresult').removeClass('delete');
							$("#deleteresult").addClass('fail');
							$("#deleteresult").text("Chỉnh sửa thất bại");
						}
				};
				$('#edit-modal').on('show.bs.modal', function(e) {
					  var id = $(e.relatedTarget).data('id');
					  
					  var s = $(e.relatedTarget).siblings();
					  $(e.relatedTarget).attr('disabled','disabled');
					  s[0].disabled = true;
					  
					  var status = 1; // xet trang thai khi nhan nut huy
					  $('#ok').on('click',function(){
						  status = 0;
						  var dataToSm = {'id':id};
						  $.ajax({
								url : 'admin/delete-cmt.html',
								type : 'POST',
								data : dataToSm,
								dataType : 'json',
								success : processJsonDelete
							});
						  
					  });
                      $('#close').on('click',function(){
						  if(status==1) // chua xoa binh luan
						  {
							  $(e.relatedTarget).removeAttr('disabled','disabled');
							  s[0].disabled = false;
						  }
					  });
					 	
					});
			    
				$('button[name="btnallow"]').on('click', function() {
					//alert("click");
					$(this).attr("disabled", "disabled");
					//$('button[name="btnwait"]').attr("disabled","disabled");
					var s = $(this).siblings();
					s[0].setAttribute("class", "disabled");
					s[0].innerHTML='';
					var id = s[1].value;
					var dataToSubmit = {
						'id' : id,
						'status' : 1
					};

					$.ajax({
						url : 'admin/list-comment.html',
						type : 'POST',
						data : dataToSubmit,
						dataType : 'json',
						success : processJsonCmt
					});

				});
				$('button[name="btnwait"]').on('click', function() {
					//alert("click");
					$(this).attr("disabled", "disabled");
					//$('button[name="btnwait"]').attr("disabled","disabled");
					var s = $(this).siblings();
					
					var id = s[0].value;
					var dataToSubmit = {
						'id' : id,
						'status' : 0
					};
					console.log(dataToSubmit);

					$.ajax({
						url : 'admin/list-comment.html',
						type : 'POST',
						data : dataToSubmit,
						dataType : 'json',
						success : processJsonCmt
					});

				});

			});
</script>
<jsp:include page="Layout/_footer.jsp" />