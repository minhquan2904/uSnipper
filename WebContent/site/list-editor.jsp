<%@ page pageEncoding="utf-8"%>
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
		<div class="row">
			<!-- profile info -->
			<div class="mn-rts-info">
				<h3
					style="color: white; background-color: #4733b7; text-align: center; padding: 10px;">
					<b>Quản lý tài khoản người dùng</b>
				</h3>
				<div class="row">
					<!-- Row -->
					<div class="panel panel-default">
						<!-- Panel info -->
						<div class="panel-body">

							<div class="col-lg-12">
								<div class="info">
									<!-- Each Info -->
									<form class="form-inline" action="index.jsp" method="post">
										<fieldset disabled="disabled" id="inputfield">
											<p id="changeResult" class="fail"></p>
											<div class="form-group">
												<!-- ID -->
												<label for="user-id">Mã Tài khoản</label> <input type="text"
													class="form-control" id="inputUserID" placeholder="/">
											</div>
											<!-- /ID -->

											<div class="form-group">
												<!-- Name -->
												<label for="rts-name">Tên tài khoản</label> <input
													type="text" class="form-control" id="inputUserName"
													placeholder="/">
											</div>
											<!-- /Name -->


										</fieldset>



									</form>
									<div class="btn-group btn-group-sm">
										<!-- btn gruop -->
										<button type="button" name="button" id="btnedit"
											class="btn btn-default" disabled="disabled">
											<span class="glyphicon glyphicon-envelope"></span> Gửi thông
											báo
										</button>
										<button type="button" name="button" id="btnblock"
											class="btn btn-default"
											style="margin-left: 40px; margin-top: 10px;"
											disabled="disabled">
											<span class="glyphicon glyphicon-lock"></span> Khóa 7 ngày
										</button>
										<button type="button" name="button" id="btnunblock"
											class="btn btn-default"
											style="margin-left: 40px; margin-top: 10px;"
											disabled="disabled">
											<span class="glyphicon glyphicon-wrench"></span> Mở khóa
										</button>
										<a class="btn btn-danger btn-minier disabled" id="btndelete" href="#edit-modal" role="button" data-toggle="modal"  style="margin-left: 40px; margin-top: 10px;"><i class="icon-edit bigger-120"></i>Xóa</a> &nbsp;
									</div>
									<!-- /btn gruop -->

								</div>
								<!-- Each Info -->


							</div>
						</div>
					</div>
					<!-- Panel info -->
				</div>
				<!-- End row -->
				<div class="row">
					<div class="tab-info">
						<!-- tab -->
						<ul class="nav nav-tabs">
							<li class="active"><a data-toggle="tab" href="#home">Tài khoản đang hoạt động</a></li>
							<li><a data-toggle="tab" href="#menu1">Tài khoản đã khóa</a></li>
						</ul>
					</div>
					 <div class="tab-content"><!-- Content -->
					 <div id="home" class="tab-pane fade in active"><!-- Home -->
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
					 	
					 </div><!-- /Home -->
					 <div id="menu1" class="tab-pane fade"><!-- Menu1 -->
					 	<c:if test="${not empty listBlock }">
						<div class="table-info">
							<table class="table table-bordered" id="list-block-editor-admin">
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
									<c:forEach var="l" items="${listBlock }" varStatus="loop">
										<tr class="clk2">
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
								$('#list-block-editor-admin').DataTable();

							});
						</script>

					</c:if>
					 </div><!-- /menu1 -->
					 </div><!-- /Content -->
					<!-- /tab -->
					

				</div>
			</div>

		</div>
		<!-- /profile info -->
	</div>
<div id="edit-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Xác nhận</h4>
            </div>
            <div class="modal-body edit-content">
            	<p id="userinfo" style="font-weight: bold;"></p>
                Tài khoản đã xóa không thể phục hồi. Bạn xác định xóa TK này?
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
	function processUser(data) {

		if (data.result == "success") {
			$('#changeResult').removeClass('fail');
			$('#changeResult').addClass('scs');
			$('#changeResult').text('Đã khóa tài khoản này')
		} else {

			$('#changeResult').removeClass('scs');
			$('#changeResult').addClass('fail');
			if (data.type == 'hasBlock') {
				$('#changeResult')
						.text(
								'Khóa thất bại. Tài khoản này đã bị khóa. Vui lòng F5 để load lại dữ liệu');
			} else {
				$('#changeResult').text('Lỗi!!!');
			}

		}
	};
	function processUser2(data) {

		if (data.result == "success") {
			$('#changeResult').removeClass('fail');
			$('#changeResult').addClass('scs');
			$('#changeResult').text('Đã mở khóa tài khoản này')
		} else {

			$('#changeResult').removeClass('scs');
			$('#changeResult').addClass('fail');			
			$('#changeResult').text('Lỗi!!!');
			

		}
	};
	function  processUser3(data){

		if (data.result == "success") {
			$('#deleteresult').removeClass('fail');
			$('#deleteresult').addClass('scs');
			$('#deleteresult').text('Đã xóa tài khoản này. Nhấn thoát để quay lại')
		} else {

			$('#deleteresult').removeClass('scs');
			$('#deleteresult').addClass('fail');			
			$('#deleteresult').text('Lỗi!!!');
			

		}
		
	}
	$('#edit-modal').on('show.bs.modal', function(e) {
			
		  var id = $('input[id=inputUserID]').val();
		  var usn = $('input[id=inputUserName]').val();
		  $("#userinfo").text("Tài khoản: "+ usn+"");
			 
		 $('#ok').on('click',function(){
			 var dataToSubmit = {
						'id' : id,
						'userName' : usn,
						'type' : "delete"
					};
			 
			 

				$.ajax({
					url : 'list-editor.html',
					type : 'POST',
					data : dataToSubmit,
					dataType : 'json',
					success : processUser3
				});
			  
		  });
		});
	$("#btnblock").click(function() {
		var id = $('input[id=inputUserID]').val();
		var usn = $('input[id=inputUserName]').val();
		var curUsn = '${sessionScope.username}';
		console.log(curUsn);
		if (curUsn != usn) {
			var dataToSubmit = {
				'id' : id,
				'userName' : usn,
				'type' : "block"
			};

			$.ajax({
				url : 'list-editor.html',
				type : 'POST',
				data : dataToSubmit,
				dataType : 'json',
				success : processUser
			});
		} else {

			$('#changeResult').removeClass('scs');
			$('#changeResult').addClass('fail');
			$('#changeResult').text('Bạn không thể tự khóa chính mình !');
		}

	});
	$("#btnunblock").click(function(e){
		var id = $('input[id=inputUserID]').val();
		var usn = $('input[id=inputUserName]').val();
		
		var dataToSubmit = {
				'id' : id,
				'userName' : usn,
				'type' : "unblock"
			};
		console.log(dataToSubmit);
		$.ajax({
			url : 'list-editor.html',
			type : 'POST',
			data : dataToSubmit,
			dataType : 'json',
			success : processUser2
		});
	});
	$(".clk").click(function() {
		var $row = $(this); // Finds the closest row <tr>
		$tds = $row.find("td"); // Finds all children <td> elements

		$('input[id=inputUserID]').val($tds[1].innerHTML);
		$('input[id=inputUserName]').val($tds[2].innerHTML);
		$("#btnblock").removeAttr('disabled');
		$row.addClass("active");
		$row.siblings().removeClass("active");

	});
	$(".clk2").click(function() {
		var $row = $(this); // Finds the closest row <tr>
		$tds = $row.find("td"); // Finds all children <td> elements

		$('input[id=inputUserID]').val($tds[1].innerHTML);
		$('input[id=inputUserName]').val($tds[2].innerHTML);
		$("#btnunblock").removeAttr('disabled');
		$("#btnblock").attr('disabled','disabled');
		$row.addClass("active");
		$row.siblings().removeClass("active");
		
		$('#btndelete').removeClass('disabled');

	});
</script>
<jsp:include page="Layout/_footer.jsp" />