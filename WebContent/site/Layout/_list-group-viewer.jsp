<%@ page pageEncoding="utf-8"%> 

<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
         <ul class="list-group" style="position:fixed;">
          <li class="list-group-item" style="disabled;color:white;background-color:#4733b7;">Dành cho Người dùng</li>
          <c:if test="${not empty hasMs}">
          	<li class="list-group-item"><a href="list-message.html?id=${user.id}">Thông báo mới!</a></li>    
          </c:if>
           <li class="list-group-item"><a href="profile.html">Trang cá nhân</a></li>          
     	  <li class="list-group-item"><a href="">Thông báo</a></li>
        </ul>
