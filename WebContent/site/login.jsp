<%@ page pageEncoding="utf-8"%>
<jsp:include page="Layout/_header.jsp"/>
<script type="text/javascript">
$(document).ready(function () {             

	$("#signupForm").validate({                 
				rules: {
					signupusername: { required: true,minlength: 8},
					signuppassword: { required: true, minlength: 6},
					confirm: {	required: true, equalTo: "#password-register" }
				},
				messages: {        
					signupusername: { required: "Không để trống !",minlength: "Ít nhất 8 ký tự!"},
					signuppassword: { required: "Không để trống !",	minlength: "Ít nhất 6 ký tự!" },    
					confirm:{ equalTo:"Không trùng với password"}
				}                 
			}); 

		
	});
	
</script>
 <div class="signin-register" style="margin-top:20px;">
		<div class="container">
			<div class="row">
				<div class="signin">
					<div class="col-xs-12 col-sm-12 col-md-5 col-lg-5">
						<form action="signin.html" method="POST" role="form" >
							<legend>Sign in</legend>
							<div class="form-group">
								<p class='fail' id="signinresult"></p>
								<label>Username</label>
								<input name="username" type="text" class="form-control" id="" placeholder="Email">
								<label>Password</label>
								<input name="password" type="password" class="form-control" id="" placeholder="Password">
							</div>
							
							<button type="button" class="btn btn-primary" value="login" name="command" style="margin-left: 45px;">Submit</button>
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
						<form action="signin.html" method="POST" role="form" id="signupForm">
							<legend>Register</legend>

							<div class="form-group">
								<p class='fail' id="signupresult"></p>
								<label for="">User Name</label>
								<input name="signupusername" type="text" class="form-control" id="" placeholder="user name">
								<br>
								<label for="">Full name</label>
								<input name="fullname" type="text" class="form-control" id="" placeholder="full name">
								<br>
								<label for="">Password</label>
								<input name="signuppassword" type="password" class="form-control" id="password-register" placeholder="Password">
								<br>
								<label for="">Confirm password</label>
								<input name="confirm" type="password" class="form-control" id="" placeholder="Confirm Password">
							</div>
							<a class="btn btn-primary" href="#edit-modal" role="button" data-toggle="modal" style="margin-left:50px;"><i class="icon-edit bigger-120"></i>Đăng ký</a> &nbsp;
							
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
	<div id="edit-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Xác nhận</h4>
            </div>
            <div class="modal-body edit-content">
               	<jsp:include page="Layout/_law.jsp"/>
                <p id="deleteresult" class="fail"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="close">Thoát</button>
                <button type="button" class="btn btn-primary" value="register" name="command">Submit</button>

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
							var role = data.role;
							if(role == 1)
								{
									window.location.replace("profile.html");
								}
							else
								{
									window.location.replace("admin/profile.html");
								}
							
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
	$('input[name=password]').bind("enterKey",function(e){
		var usn = $('input[name=username]').val();
		var pass = $('input[name=password]').val();
		var cmd = 'login';
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
		
		
		$.ajax({
			url:'signin.html',
			type:'POST',
			data: dataToSubmit,
			dataType: 'json',
			success: singinProcess
		}); 
		});
	$('input[name=password]').keyup(function(e){
	    if(e.keyCode == 13)
	    {
	        $(this).trigger("enterKey");
	    }
	});

</script>
<jsp:include page="Layout/_footer.jsp"/>

