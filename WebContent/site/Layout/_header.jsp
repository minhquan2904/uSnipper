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
          <li><a href="hint-rts.jsp"><span class="glyphicon glyphicon-cutlery"></span> Đóng góp quán ăn mới</a></li>
        </ul>
  <div class="row nav navbar-nav navbar-right">
    <div class = "col-lg-12 col-md-12 col-sm-12 search-bar fd-search">
      <div class="col-lg-6 col-md-6 col-sm-6">
        <div class="input-group" style="width:750px">
          <div class="input-group-btn">
            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">  Địa chỉ<span class="caret"></span></button>
            <ul class="dropdown-menu">
              <li><a href="#">Địa chỉ</a></li>
              <li><a href="#">Xếp hạng cao nhất</a></li>
              <li><a href="#">Món ăn</a></li>
              <li role="separator" class="divider"></li>
              <li><a href="#">Khác...</a></li>
            </ul><!-- button district -->
          </div>
          <div class="input-group-btn">
            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">  Thủ Đức<span class="caret"></span></button>
            <ul class="dropdown-menu">
              <li><a href="#">Thủ Đức</a></li>
              <li><a href="#">Quận 9</a></li>
              <li><a href="#">Bình Thạnh</a></li>
              <li role="separator" class="divider"></li>
              <li><a href="#">Khác...</a></li>
            </ul><!-- button district -->
          </div>

          <div class="input-group-btn">
            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Linh Chiểu<span class="caret"></span></button>
            <ul class="dropdown-menu">
              <li><a href="#">Linh Chiểu</a></li>
              <li><a href="#">Bình Thọ</a></li>
              <li><a href="#">Linh Trung</a></li>
              <li role="separator" class="divider"></li>
              <li><a href="#">Khác...</a></li>
            </ul><!-- button guild -->
          </div><!-- /btn-group -->
          <input type="text" class="form-control fd-input" aria-label="" placeholder="Tìm kiếm theo địa chỉ" style="width:400px">
          <button type="button" class="btn btn-default btn-icon"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
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
