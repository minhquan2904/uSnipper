<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang ="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" href="images/rsz_snip.png" type="image/x-icon" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<base href="/Usnipper/"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="vendor/bootstrap.js"></script>
<script type="text/javascript" src="1.js"></script>
<link rel="stylesheet" href="vendor/bootstrap.css">
<link rel="stylesheet" href="vendor/index.css">
<link rel="stylesheet" href="vendor/font-awesome.css">
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<title>UTE SNIPPER</title>
</head>
<body>
	<header>
  <!-- Heading -->
  <div class="topBar">

    <div class="row">
      <div class="col-lg-12 col-md-12 col-sm-12 fd-container top">
        <a href="home.html" class="fd-logo">utesnipper<span class="dotfirebase"></span><span class="dotcom">.com</span></a>

        <div class="login-top">
          <ul class="footer-nav">
          
           <c:choose>
				<c:when test="${empty sessionScope.username }">
	                      		<li><a href="signin.html" class="footer-a" style="color: #4733b7;"><span class="glyphicon glyphicon-user"></span> Đăng nhập</a></li>
	                      		<li><a href="signin.html" class="footer-a" style="color: #4733b7;"><span class="glyphicon glyphicon-send"></span> Đăng kí</a></li>
	                      	</c:when>
				<c:otherwise>
	                  			<li><a href="profile.html" class="footer-a" style="color: #4733b7;"><span class="glyphicon glyphicon-user"></span>${sessionScope.tenNguoiDung}</a></li>
	                  			<li><a href="signout.html" class="footer-a" style="color: #4733b7;"><span class="glyphicon glyphicon-send"></span> Đăng xuất</a></li>
	                  			
	                  					</c:otherwise>
			</c:choose>
            
            
            <li><a href="Index.jsp" class="footer-a" style="color: #4733b7;"><span class="glyphicon glyphicon-earphone"></span> Liên hệ</a></li>
          </ul>
        </div>

      </div>
    </div>

    <!-- menu bar -->
    <nav class="navbar navbar-default" role="navigation">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="home.html"><span class="glyphicon glyphicon-home"></span> Trang chủ</a>
      </div>
    <!-- Search bar -->

      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse navbar-ex1-collapse">
        <ul class="nav navbar-nav">
          <li><a href="nearby.html"><span class="glyphicon glyphicon-globe"></span> Tìm quanh đây</a></li>
          <li><a href="hint-rts.html"><span class="glyphicon glyphicon-cutlery"></span> Đóng góp quán ăn mới</a></li>
        </ul>
  <div class="row nav navbar-nav navbar-right">
    <div class = "col-lg-12 col-md-12 col-sm-12 search-bar fd-search" style="    padding-bottom: 0px;">
      <div class="col-lg-6 col-md-6 col-sm-6">
        <div class="input-group" style="width:850px">
          <div class="input-group-btn">
           <form method="post" action="find.html">
           		<select class="form-control mySelect" id="ipmySelect" name="mySelect">
           			<option value="0">Tìm theo địa chỉ</option>
           			<option value="1">Tìm theo món nổi bật</option>
           			<option value="2">Tìm theo tên quán ăn</option>
           		</select>
	          <input type="text" class="form-control fd-input" aria-label="" placeholder="Tìm kiếm theo địa chỉ" style="width:400px" id="myInput" name="myInput">
	          <button type="submit" class="btn btn-default btn-icon"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
           </form>
         
        </div><!-- /input-group -->
      </div>
    </div>
  </div>
          <ul class="nav navbar-nav navbar-right login">
          <li><a href="login.jsp" >Sign in</a></li>
          <li><a href="#">Sign up</a></li>
          <li><a href="#">About</a></li>
        </ul>
      </div><!-- /.navbar-collapse -->
    </nav>
  </div>
</header>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBwTYGP_-vrJ6AAmCuYPY8mFRso4jfCUsQ&v=3.exp&sensor=true&libraries=places"></script>

<script type="text/javascript">
$( document ).ready(function() {
	var input =  document.getElementById('myInput');
	var autocomplete = new google.maps.places.Autocomplete(input);
	$( ".mySelect" ).change(function() {
		var role = $(".mySelect option:selected").val();
		if(role == 1 || role == 2)
			{
				
			}
		if(role == 0)
			{
				autocomplete = new google.maps.places.Autocomplete(input);
			}
		});

	
});

	
</script>