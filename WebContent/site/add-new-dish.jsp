<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<jsp:include page="Layout/_header.jsp"></jsp:include>
 <div class="container">
    <div class="col-lg-2" >
     <jsp:include page="Layout/_list-group-editor.jsp"></jsp:include>
    </div>
    <div class="col-lg-10"  >
      
      	
      	<h3>Danh sách món ăn</h3>
     	<table class="table table-striped">
     		<thead>
     			<tr>
     				<th>STT</th>
     				<th>id</th>
     				<th>Tên món ăn</th>
     			</tr>
     		</thead>
     		<tbody>
     			<c:forEach var="l" items="${list}" varStatus="loop">
     				<tr>
     					<td>${loop.index +1}</td>
     					<td>${l.id}</td>
     					<td>${l.tenMonAn}</td>
     				</tr>
     			</c:forEach>
     		</tbody>
     	</table>
       
      </div>

    </div>
 </div>
<jsp:include page="Layout/_footer.jsp"></jsp:include>