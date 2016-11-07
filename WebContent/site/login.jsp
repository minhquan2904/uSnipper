<%@ page pageEncoding="utf-8"%>
<jsp:include page="Layout/_header.jsp"/>
 <div class="signin-register" style="margin-top:20px;">
		<div class="container">
			<div class="row">
				<div class="signin">
					<div class="col-xs-12 col-sm-12 col-md-5 col-lg-5">
						<form action="signin.html" method="POST" role="form">
							<legend>Sign in</legend>
							<div class="form-group">
								<label>Email</label>
								<input name="username" type="text" class="form-control" id="" placeholder="Email">
								<label>Password</label>
								<input name="password"type="password" class="form-control" id="" placeholder="Password">
							</div>
							
							<button type="submit" class="btn btn-primary" value="login" name="command">Submit</button>
              <a href="profileEditor.jsp">Đăng nhập vào quản trị viên (test)</a>
              <a href="profileAdmin.jsp">Đăng nhập vào Admin (test)</a>
						</form>

					</div>
				</div>
				<div class="col-xs-4 col-sm-4 col-md-2 col-lg-2">
					<div class="or text-center">
						<h1>Or</h1>
					</div>
				</div>
				<div class="register">
					<div class="col-xs-12 col-sm-12 col-md-5 col-lg-5">
						<form action="signin.jsp" method="POST" role="form">
							<legend>Register</legend>

							<div class="form-group">
								<label for="">Email</label>
								<input name="email" type="text" class="form-control" id="" placeholder="Email">
								<label for="">Password</label>
								<input name="password" type="password" class="form-control" id="" placeholder="Password">
								<label for="">Confirm password</label>
								<input name="confirm" type="password" class="form-control" id="" placeholder="Confirm Password">
							</div>
							<button type="submit" class="btn btn-primary" value="register" name="command">Submit</button>

						</form>
					</div>
				</div>

			</div>
		</div>
	</div>
<jsp:include page="Layout/_footer.jsp"/>

