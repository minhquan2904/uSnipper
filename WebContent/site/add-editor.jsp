<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s"%>
<jsp:include page="Layout/_header.jsp" />

<div class="container">
	<div class="col-lg-2">
		<!-- List function -->
		<div class="row">
			<jsp:include page="Layout/_list-group-admin.jsp" />
		</div>
	</div>
	<!-- /List function -->
	<div class="col-lg-10">
		<div class="add-editor">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Thêm tài khoản mới</h3>
				</div>
				<div class="panel-body">
					<div class="info" style="margin-top: 10px;">
						<!-- Insert -->
						<form class="form-inline" action="">
							<p id='result' class="fail"></p>
							<label style="font-size: 20px; width: 1000px;">Thêm tài
								khoản mới</label>
							<div class="form-group">
								<!-- Name -->
								<label for="rts-name">Tên tài khoản</label> <input type="text"
									class="form-control" name="inputUserName"
									style="max-width: 200px" placeholder="Nhập tên tài khoản">
							</div>
							<div class="form-group">
								<!-- Pass -->
								<label for="pass">Mật khẩu</label> <input type="password"
									class="form-control" name="inputPassword"
									style="max-width: 200px; margin-left: 30px;"
									placeholder="Nhập mật khẩu">

							</div>
							<div class="form-group">
								<!-- Pass -->
								<label for="pass">Xác nhận </label> <input type="password"
									class="form-control" name="inputConfirm"
									style="max-width: 200px; margin-left: 30px;"
									placeholder="Nhập lại mật khẩu">

							</div>
							<div class="form-group">
								<!-- Pass -->
								<label for="pass">Quyền</label> 
								<select
									class="form-control" name="roleSelect" style="width:200px;margin-left: 47px;">
									<option value="2">Quản trị viên</option>
									<option value="3">Admin</option>
									
								</select>
								<br/>
							</div>
							<button type="button" id="insertUser" class="btn btn-success"
								style="margin-left: 185px; margin-top: 10px;">Thêm mới</button>
						</form>
					</div>
					<!-- /Insert -->


				</div>
				<div class="panel-footer">
					<c:if test="${not empty listActive }">
						<div class="table-info">
							<table class="table table-bordered" id="list-editor-admin">
								<thead>
									<tr>
										<th>STT</th>
										<th>Mã tài khoản</th>
										<th>Tên tài khoản</th>
										<th>Tên hiển thị</th>
										<th>Email</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="l" items="${listActive }" varStatus="loop">
										<tr class="clk">
											<td class="fund">${loop.index +1}</td>
											<td class='org'>${l.id }</td>
											<td>${l.userName}</td>
											<td>${l.tenNguoiDung}</td>
											<td>${l.email}</td>
										</tr>
									</c:forEach>



								</tbody>
							</table>
						</div>
						<link rel="stylesheet"
							href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css"
							type="text/css">
						<script type="text/javascript"
							src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
						<script type="text/javascript">
							$(document).ready(function() {
								$('#list-editor-admin').DataTable();

							});
						</script>

					</c:if>
				</div>
			</div>
		</div>

	</div>

</div>
<script type="text/javascript">
	$(document).ready(function() {
		function processUser(data) {
			if(data.result == 'fail')
				{
					$('#result').removeClass('scs');
					$('#result').addClass('fail');
					if(data.type == 'hasUser')
						{						
						$('#result').text('Tài khoản đã tồn tại.');
						}
					else
						{
						$('#result').text('CODE ERROR');
						}
				}
			else
				{
				$('#result').removeClass('fail');
				$('#result').addClass('scs');
				$('#result').text('Thêm mới thành công. F5 để load lại dữ liệu');
				}
		}
		$("#insertUser").click(function() {
			var usn = $('input[name=inputUserName]').val();
			var pass = $('input[name=inputPassword]').val();
			var cfm = $('input[name=inputConfirm]').val();
			var role = $('select[name=roleSelect]').val();
			if (cfm != pass) {
				$('#result').removeClass('scs');
				$('#result').addClass('fail');
				$('#result').text('Mật khẩu xác nhận không trùng khớp');
			} else {
				var dataToSubmit = {
					'username' : usn,
					'password' : pass,
					'role':role				}
				/*console.log(dataToSubmit); */
	 			
				$.ajax({
					url : 'add-editor.html',
					type : 'POST',
					data : dataToSubmit,
					dataType : 'json',
					success : processUser
				}); 
			}

		});
	});
</script>
<jsp:include page="Layout/_footer.jsp" />
