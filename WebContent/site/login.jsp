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
								<p class='fail' id="signinresult"></p>
								<label>Username</label>
								<input name="username" type="text" class="form-control" id="" placeholder="Email">
								<label>Password</label>
								<input name="password" type="password" class="form-control" id="" placeholder="Password">
							</div>
							
							<button type="button" class="btn btn-primary" value="login" name="command">Submit</button>
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
						<form action="signin.html" method="POST" role="form">
							<legend>Register</legend>

							<div class="form-group">
								<p class='fail' id="signupresult"></p>
								<label for="">User Name</label>
								<input name="signupusername" type="text" class="form-control" id="" placeholder="user name">
								<label for="">Full name</label>
								<input name="fullname" type="text" class="form-control" id="" placeholder="full name">
								<label for="">Password</label>
								<input name="signuppassword" type="password" class="form-control" id="" placeholder="Password">
								<label for="">Confirm password</label>
								<input name="confirm" type="password" class="form-control" id="" placeholder="Confirm Password">
							</div>
							<button type="button" class="btn btn-primary" value="register" name="command">Submit</button>

						</form>
					</div>
				</div>

			</div>
		</div>
	</div>
	
<script type="text/javascript">

	function singinProcess(data)
	{
		
		if(data.result == 'fail')
			{
				if(data.type=='login')
					{
						$("#signinresult").removeClass('scs');
						$('#signinresult').addClass('fail');
						$('#signinresult').text('Đăng nhập thất bại.Vui lòng kiểm tra lại thông tin đăng nhập');
					}
				else
					{
						if(data.error=='hasUser')
							{
								$("#signupresult").removeClass('scs');
								$('#signupresult').addClass('fail');
								$('#signupresult').text('Đăng kí thất bại, tên đăng nhập đã tồn tại');
							}
						else
							{
								$("#signupresult").removeClass('scs');
								$('#signupresult').addClass('fail');
								$('#signupresult').text('Đăng kí thất bại, mật khẩu xác nhận không trùng khớp');
							}
						
					}
			}
		else
			{
				if(data.type=='login')
					{
						if(data.status == 0)
						{
							var dateBlock = data.dateBlock;
							$("#signinresult").removeClass('scs');
							$('#signinresult').addClass('fail');
							$('#signinresult').text('Tài khoản của bạn bị khóa đến : '+ dateBlock);
						}
						else
						{					
							window.location.href= "profile.html";
						}
					}
				if(data.type=='signup')
					{
						$("#signupresult").removeClass('fail');
						$('#signupresult').addClass('scs');
						$('#signupresult').text('Đăng kí thành công');
					}
				
			}
	}
	$('button[name=command]').click(function(){
		var usn = $('input[name=username]').val();
		var pass = $('input[name=password]').val();
		var cmd = $(this).val();
		var dataToSubmit = '';
		if(cmd=='login')
			{
			dataToSubmit = {'username':usn,'password':pass,'command':cmd};
			}
		else
			{
			usn = $('input[name=signupusername]').val();
			pass = $('input[name=signuppassword]').val();
			var fullname=$('input[name=fullname]').val();
			var confirm=$('input[name=confirm]').val();
			dataToSubmit = {'username':usn,'password':pass,'command':cmd,'fullname':fullname,'confirm':confirm};
			}
		console.log(dataToSubmit);
		
		$.ajax({
			url:'signin.html',
			type:'POST',
			data: dataToSubmit,
			dataType: 'json',
			success: singinProcess
		}); 
		
	});
</script>
<jsp:include page="Layout/_footer.jsp"/>

