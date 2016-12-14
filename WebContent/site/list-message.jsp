<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<jsp:include page="Layout/_header.jsp" />
<div class="container" style="min-height:300px;">
	<div class="col-lg-2">
		<!-- List function -->
		<div class="row">
			<jsp:include page="Layout/_list-group-viewer.jsp" />
		</div>
	</div>
	<!-- /List function -->
	<div class="col-lg-10">
		<div class="row" style="margin-top: 20px;">
			<!-- profile info -->
			<h2 class="mq_h4">Danh sách thông báo</h2>
			<h3 id="result" class="scs"></h3>
			<table class="table table-striped" id="tb0">
				<thead>
					<tr>
						<th>STT</th>
						<th>Người gửi</th>
						<th>Nội dung</th>
						<th>Đánh dấu là đã đọc</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="l" items="${list}" varStatus="loop">
						<tr>
							<td>${loop.index +1 }</td>
							<td>${l.sender}</td>
							<td>${l.text}</td>
							<td><button type="button" data-id="${l.id}"
									class="btn btn-success" name="btnseen"
									style="margin-left: 35px;"><span class="glyphicon glyphicon-ok"></span></button></td>
						</tr>

					</c:forEach>

				</tbody>
			</table>
			<script type="text/javascript">
				function processUpdate(data) {
					if (data.result == 'success') {
						$("#result").text('Đã chỉnh sửa trạng thái');
					}
				}
				$(document).ready(function() {
					 
					$('button[name=btnseen]').click(function() {
						var id = $(this).data("id");
						var dataToSubmit = {
							'id' : id
						}
						console.log(dataToSubmit)
						$(this).attr('disabled', 'disabled');
						$.ajax({
							url : 'list-message.html',
							type : 'POST',
							data : dataToSubmit,
							dataType : 'json',
							success : processUpdate
						});
					});
				});
			</script>

		</div>
		<!-- /profile info -->
	</div>

</div>

<jsp:include page="Layout/_footer.jsp" />
