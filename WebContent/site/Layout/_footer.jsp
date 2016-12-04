<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
 <footer class="site-footer">
    <div class="container-fluid">
      <div class="row">
      <div class="col-md-5">
        <address class="">
          484, Le Van Viet Street, Dist 9 <br>
          HoChiMinh city.<br>
            VietNam
        </address>
      </div>
      </div>
      <div class="bottom-footer">
          <div class="col-md-5">
                Copyright © 2016. All rights reserved.
          </div>
          <div class="col-md-7">
              <ul class="footer-nav">
                <li><a href="index.html" class="footer-a">Trang chủ</a></li>
                <li><a href="#" class="footer-a">Liên hệ với chúng tôi</a></li>
                <li><a href="#" class="footer-a">About</a></li>
              </ul>
          </div>
      </div>
    </div>
  </footer>
</body>
</html>