<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<jsp:include page="Layout/_header.jsp" />
<div class="container" style="min-height:300px;">
	<div class="col-lg-2">
		<!-- List function -->
		<div class="row">
			<jsp:include page="Layout/_list-group-editor.jsp" />
		</div>
	</div>
	<!-- /List function -->
	<div class="col-lg-10">
		<div class="row" style="margin-top: 20px;">
			<!-- profile info -->
			<h2 class="mq_h4">Danh sách quán ăn đóng góp</h2>
			<h3 id="result" class="scs"></h3>
			<table class="table table-striped" id="tb0">
				<thead>
					<tr>
						<th>STT</th>
						<th>Tên quán ăn</th>
						<th>Địa chỉ</th>
						<th>Mô tả</th>
						<th>Món ăn</th>
						<th>Chi tiết</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="l" items="${list}" varStatus="loop">
						<tr>
							<td>${loop.index +1 }</td>
							<td>${l.tenQuanAn}</td>
							<td>${l.diaChi}</td>
							<td>${l.moTa}</td>
							<td>${l.monAn}</td>
							<td><a class="btn btn-default" href="tempDetail.html?id=${l.id}"><span class="glyphicon glyphicon-pencil"></span></a></td>
						</tr>

					</c:forEach>

				</tbody>
			</table>
			<script type="text/javascript">
				
			</script>

		</div>
		<!-- /profile info -->
	</div>

</div>
<link rel="stylesheet"
href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css"
type="text/css">
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
$('#tb0').DataTable();
</script>
<jsp:include page="Layout/_footer.jsp" />
