<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s"%>
<jsp:include page="Layout/_header.jsp" />
<div class="container">
	<!-- container -->
	<div class="col-lg-2">
		<!-- List function -->
		<div class="row">
		<c:if test="${Quyen == 2 }">
			<jsp:include page="Layout/_list-group-admin.jsp" />
		</c:if>
		<c:if test="${Quyen == 3}">
			<jsp:include page="Layout/_list-group-editor.jsp" />
		</c:if>
		</div>
	</div>
	<!-- /List function -->

	<div class="col-lg-10">
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
						<div class="col-lg-3">
							<div class="info" style="width: 300px;">
								<!-- search box -->
								<h4 style="text-align: center">Tìm kiếm</h4>
								<div class="search-form">
									<!-- search form -->
									<form class="form-inline" action="list-mem.html" method="post">
										<div class="form-group">
											<label for="name">Tên người dùng</label> <input type="text"
												class="form-control" name="name" id="" placeholder="">
										</div>
										<button type="submit" name="button" class="btn btn-default"
											style="margin-left: 100px;">Tìm kiếm</button>
									</form>

								</div>
								<!-- /search form -->

							</div>
							<!-- /search box -->
						</div>
						<div class="col-lg-7">
							<div class="info" style="width: 500px; margin-left: 200px">
								<!-- Each Info -->
								<form class="form-inline" action="index.jsp" method="post">
									<fieldset id="inputfield">
										<div class="form-group" style="width: 500px;">
											<!-- ID -->
											<label for="mem-id">Mã Tài khoản</label> <input type="text"
												class="form-control" id="inputUserID" placeholder="/"
												readonly="readonly">
										</div>
										<!-- /ID -->

										<div class="form-group">
											<!-- Name -->
											<label for="rts-name">Tên hiển thị</label> <input type="text"
												class="form-control" id="inputUserName" placeholder="\"
												readonly="readonly" style="margin-left: 10px;">
										</div>
										<!-- /Name -->


									</fieldset>



								</form>
								<div class="btn-group btn-group-sm">
									<!-- btn gruop -->
									<button type="button" name="button" id="btndelete"
										class="btn btn-default" disabled="disabled" style="margin-left: 40px; margin-top: 10px;">
										<span class="glyphicon glyphicon-plus"></span> Xóa
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
				<div class="table-info">
				<h3 class="fail" id="result"></h3>
					<table class="table table-bordered" id="tb1">
						<thead>
							<tr>
								<th>STT</th>
								<th>Mã Tài khoản</th>
								<th>Tên hiển thị</th>
								<th>Trạng thái</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty list}">
								<h3 class="fail" >Không có người dùng nào được chọn</h3>
							</c:if>
							
							<c:if test="${not empty list}">
								<c:forEach var="l" items="${list}" varStatus="loop">
									<tr class="clk">
										<td class="fund">${loop.index+1 }</td>
										<td class='org'>${l.id}</td>
										<td>${l.tenNguoiDung}</td>
										<c:if test="${l.trangThai == 0 }">
											<td>Đang bị khóa</td>
										</c:if>
										<c:if test="${l.trangThai == 1 }">
											<td>Hoạt động</td>
										</c:if>
									</tr>
								</c:forEach>
							</c:if>
							


						</tbody>
					</table>
				</div>

			</div>
		</div>

	</div>
</div>
<!-- container -->
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css"
	type="text/css">
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>


<script type="text/javascript">
	function processUnblock(data)
	{
		if(data.result=='success')
			{
			$('#result').removeClass('fail');
			$('#result').addClass('scs');
			$('#result').text('Đã mở khóa tài khoản này');
			}
		else
			{
			$('#result').removeClass('scs');
			$('#result').addClass('fail');
			$('#result').text('Lỗi')
			}
	}
	function processDelete(data)
	{
		if(data.result=='success')
			{
			$('#result').removeClass('fail');
			$('#result').addClass('scs');
			$('#result').text('Đã xóa khóa tài khoản này');
			}
		else
			{
			$('#result').removeClass('scs');
			$('#result').addClass('fail');
			$('#result').text('Lỗi')
			}
	}
	function processBlock(data)
	{
		if(data.result=='success')
		{
		$('#result').removeClass('fail');
		$('#result').addClass('scs');
		$('#result').text('Đã khóa tài khoản này');
		}
	else
		{
		if(data.type == 'hasBlock')
			{
			$('#result').removeClass('scs');
			$('#result').addClass('fail');
			$('#result').text('Tài khoản đã bị khóa. F5 để load lại dữ liệu');
			}
		else
			{
			$('#result').removeClass('scs');
			$('#result').addClass('fail');
			$('#result').text('Lỗi');
			}
		
		}
	}
	$('#tb1').DataTable();

	$(document).ready(function() {
		$(".clk").click(function() {
			var $row = $(this); // Finds the closest row <tr>
			$tds = $row.find("td"); // Finds all children <td> elements

			$('input[id=inputUserID]').val($tds[1].innerHTML);
			$('input[id=inputUserName]').val($tds[2].innerHTML);
			var stt = $tds[3].innerHTML;
			if (stt == 'Hoạt động') {
				$("#btnblock").removeAttr('disabled');
				$('btnunblock').attr('disabled', 'disabled');
			} else {
				$("#btnblock").attr('disabled', 'disabled');
				$("#btnunblock").removeAttr('disabled');
			}
			$("#btndelete").removeAttr('disabled');
			$row.addClass("active");
			$row.siblings().removeClass("active");

		});

		$("#btnblock").click(function() {
			var id = $('input[id=inputUserID]').val();
			var usn = $('input[id=inputUserName]').val();

			var dataToSubmit = {
				'id' : id,
				'type' : "blockmem"
			};

			
			$.ajax({
				url : 'list-editor.html',
				type : 'POST',
				data : dataToSubmit,
				dataType : 'json',
				success : processBlock
			});
			 

		});
		$("#btnunblock").click(function() {
			var id = $('input[id=inputUserID]').val();
			var dataToSubmit = {
				'id' : id,
				'type' : "unblockmem"
			}
			$.ajax({
				url : 'list-editor.html',
				type : 'POST',
				data : dataToSubmit,
				dataType : 'json',
				success : processUnblock
			});
		});
		$("#btndelete").click(function(){
			var id = $('input[id=inputUserID]').val();
			var dataToSubmit = {
				'id' : id,
				'type' : "deletemem"
			}
			$.ajax({
				url : 'list-editor.html',
				type : 'POST',
				data : dataToSubmit,
				dataType : 'json',
				success : processDelete
			});
		});

	})
</script>
<jsp:include page="Layout/_footer.jsp" />
