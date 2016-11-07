<%@ page pageEncoding="utf-8"%>
<jsp:include page="Layout/_header.jsp"></jsp:include>
 <div class="container">
    <div class="col-lg-2" >
      <div class="row">
        <ul class="list-group" style="position:fixed;">
          <li class="list-group-item" style="disabled;color:white;background-color:#4733b7;">Dành cho admin</li>
          <li class="list-group-item"><a href="profileEditor.jsp"><span class="glyphicon glyphicon-arrow-left"></span> Quay lại</a></li>
          <li class="list-group-item"><a href="#">Xem thông báo</a></li>
          <li class="list-group-item"><a href="#"><span class="glyphicon glyphicon-pencil"></span> Chỉnh sửa thông tin cá nhân</a></li>
        </ul>
      </div>

    </div>
    <div class="col-lg-10"  >
      <div class="row" >
        <form class="form-horizontal" action="index.jsp" method="post">
          <h3 style="disabled;color:white;background-color:#4733b7;text-align:center; padding:10px;margin-left:10px;"><b>Thêm quán ăn</b></h3>

            <div class="form-group"><!-- RTS name -->
              <label for="rts-name">Tên quán ăn</label>
              <input type="text" class="form-control" id="rts" placeholder="Nhập tên quán ăn">
            </div><!-- /RTS name -->
            <hr>
            <div class="form-group"><!-- RTS type -->
              <label for="type">Loại quán ăn</label>
              <p class="help-block"><i>Hướng dẫn: Một quán ăn có thể có nhiều loại.</i></p>
              <div class="checkbox-inline">
                <label class="checkbox-inline"><input type="checkbox" value="1">Cơm bình dân</label>
                <label class="checkbox-inline"><input type="checkbox" value="2">Cơm tấm</label>
                <label class="checkbox-inline"><input type="checkbox" value="3">Cơm gà,bò xào</label>
                <label class="checkbox-inline"><input type="checkbox" value="4">Cơm chay</label>
                <label class="checkbox-inline"><input type="checkbox" value="5">Hủ tiếu</label>
                <label class="checkbox-inline"><input type="checkbox" value="6">Phở</label>
              </div><!-- /RTS type -->
              <hr>

            </div>

            <div class="form-group">
              <label for="address">Địa chỉ</label>
            </div>
        </form>
          <form class="form-inline" action="index.jsp" method="post"> <!-- Address -->
          <div class="form-group" style="margin-left:20px;">
            <label for="number"style="margin-left:10px;" >Số nhà</label>
            <input type="text" class="form-control" id="rtsnumber" placeholder="Số nhà" style="max-width:100px;">
          </div>

        <div class="form-group">
          <label for="street" style="margin-left:20px;">Tên đường</label>
          <select class="street" name="str" style="margin-left: 10px;">
            <option>Võ Văn Ngân</option>
            <option>Đặng Văn Bi</option>
            <option>Kha Vạn Cân</option>
            <option>Phạm Văn Đồng</option>
            <option>Xa lộ Hà Nội</option>
          </select>
        </div>
        <div class="form-group">
          <label for="street" style="margin-left:20px;">Quận</label>
          <select class="street" name="str" style="margin-left: 10px;">
            <option>Thủ Đức</option>
            <option>Bình Thạnh</option>
            <option>Gò Vấp</option>
            <option>Quận 2</option>
            <option>Quận 9</option>
          </select>
        </div>
        <div class="form-group" style="margin-left:20px;">
          <label for="number" >Latitude</label>
          <input type="text" class="form-control" id="rtsnumber" placeholder="Lat" style="max-width:100px;S">
        </div>
        <div class="form-group" style="margin-left:20px;">
          <label for="number" >Longtitude</label>
          <input type="text" class="form-control" id="rtsnumber" placeholder="Lng" style="max-width:100px;S">
        </div>
      </form><!-- /Address -->
      <hr>
        <div class="form-group"><!-- Dish -->
          <label for="rts-dish" class="lb-left">Món ăn</label>
          <div class="list-dish">
            <form id="dishForm" class="form-horizontal" action="index.jsp" method="post" >
                <div id="div-list">
                  <div class="form-group" style="margin-left:40px;">
                    <label for="dish-name" id="lb-small">Tên món ăn</label>
                    <p class="help-block"><i>Lưu ý:Nhập tên món ăn ở textbox đầu tiên,giá tiền ở textbox thứ 2 và chọn hình ảnh ở textbox thứ 3</i></p>

                    <input type="text" class="form-control" id="dish-name" placeholder="Tên món ăn">
                    <input type="number" class="form-control" name="name" value="" placeholder="Giá tiền"  style="max-width:450px;">
                    <input	name="img" type="file" class="specInput"  >

                  </div>
                  <div class="form-group" style="margin-left:40px;">
                    <label for="dish-name" id="lb-small">Tên món ăn</label>
                    <p class="help-block"><i>Lưu ý:Nhập tên món ăn ở textbox đầu tiên,giá tiền ở textbox thứ 2 và chọn hình ảnh ở textbox thứ 3</i></p>

                    <input type="text" class="form-control" id="dish-name" placeholder="Tên món ăn">
                    <input type="number" class="form-control" name="name" value="" placeholder="Giá tiền"  style="max-width:450px;">
                    <input	name="img" type="file" class="specInput"  >

                  </div>



                </div>
                <button type="button" id="addbtn" name="button" class="btn btn-default" style="margin-left:40px;">Thêm món ăn</button>
              </form>

          </div>

        </div><!-- /Dish -->
        <hr>
        <div class="form-group" style="margin-left:20px;"><!-- Images -->
          <label for="" style="font-size:20px;">Hình ảnh quán ăn</label>
          <p class="help-block"><i>Lưu ý:Kéo thả hình ảnh vào vùng "Drag & drop files here" hoặc chọn hình ảnh để tải lên.<br>Chọn ít nhất 2 hình ảnh</i></p>
          <input id="file-1" type="file" multiple="" class="file" data-overwrite-initial="false" data-min-file-count="2" >
           </div><!-- /Images -->
          </div>
          <hr>

          <div class="btn-gr"> <!-- Btn function -->
            <a href="preview-rts.jsp" class="btn btn-default">Xem trước</a>

          </div><!-- /Btn function -->
      </div>

    </div>
  <link rel="stylesheet" href="vendor/fileinput.css">
<link rel="stylesheet" href="vendor/fileinput.min.css">
<script type="text/javascript" src="js/fileinput.js"></script>
<script type="text/javascript" src="js/fileinput.min.js"></script>
<script type="text/javascript">
  function add()
  {
   var lscontaner = document.getElementById("div-list");

   var newI = document.createElement("div");
   newI.setAttribute("class","form-group");
   newI.setAttribute("style","margin-left:40px");

   var label = document.createElement("label");
   label.setAttribute("for","dish-name");
   label.setAttribute("id","lb-small");
   label.appendChild(document.createTextNode("Tên món ăn"));

   var p = document.createElement("p");
   p.setAttribute("class","help-block");
   var i = document.createElement("i");
   i.appendChild(document.createTextNode("Lưu ý:Nhập tên món ăn ở textbox đầu tiên,giá tiền ở textbox thứ 2 và chọn hình ảnh ở textbox thứ 3"));
   p.appendChild(i);


   var input = document.createElement("input");
   input.setAttribute("type","text");
   input.setAttribute("class","form-control");
   input.setAttribute("id","dish-name");
   input.setAttribute("placeholder","Tên món ăn");

   var input1 = document.createElement("input");
   input1.setAttribute("type","number");
   input1.setAttribute("style","max-width:450px;");
   input1.setAttribute("class","form-control");
   input1.setAttribute("placeholder","Giá tiền");



   var input2 = document.createElement("input");
   input2.setAttribute("type","file");
   input2.setAttribute("class","specInput");
   input2.setAttribute("name","img");


   newI.appendChild(label);
   newI.appendChild(p);
   newI.appendChild(input);
   newI.appendChild(input1);
   newI.appendChild(input2);



   lscontaner.appendChild(newI);


  }
  $(document).ready(
    function()
    {
      $("#addbtn").click(function()
				{
					add();
          $(".specInput").fileinput({
            uploadUrl: '#', // you must set a valid URL here else you will get an error
            allowedFileExtensions : ['jpg', 'png','gif'],

            });

				}
			);

    }
  );

  $(".specInput").fileinput({
    uploadUrl: '#', // you must set a valid URL here else you will get an error
    allowedFileExtensions : ['jpg', 'png','gif'],


  });

  $('#file-fr').fileinput({
      language: 'fr',
      uploadUrl: '#',
      allowedFileExtensions : ['jpg', 'png','gif'],
  });
  $('#file-es').fileinput({
      language: 'es',
      uploadUrl: '#',
      allowedFileExtensions : ['jpg', 'png','gif'],
  });
  $("#file-0").fileinput({
      'allowedFileExtensions' : ['jpg', 'png','gif'],
  });
  $("#file-1").fileinput({
      uploadUrl: '#', // you must set a valid URL here else you will get an error
      allowedFileExtensions : ['jpg', 'png','gif'],
      overwriteInitial: false,
      maxFileSize: 1000,
      maxFilesNum: 10,
      //allowedFileTypes: ['image', 'video', 'flash'],
      slugCallback: function(filename) {
          return filename.replace('(', '_').replace(']', '_');
      }
});
  /*
  $(".file").on('fileselect', function(event, n, l) {
      alert('File Selected. Name: ' + l + ', Num: ' + n);
  });
  */
$("#file-3").fileinput({
  showUpload: false,
  showCaption: false,
  browseClass: "btn btn-primary btn-lg",
  fileType: "any",
      previewFileIcon: "<i class='glyphicon glyphicon-king'></i>"
});
$("#file-4").fileinput({
  uploadExtraData: {kvId: '10'}
});
  $(".btn-warning").on('click', function() {
      if ($('#file-4').attr('disabled')) {
          $('#file-4').fileinput('enable');
      } else {
          $('#file-4').fileinput('disable');
      }
  });
  $(".btn-info").on('click', function() {
      $('#file-4').fileinput('refresh', {previewClass:'bg-info'});
  });
  /*
  $('#file-4').on('fileselectnone', function() {
      alert('Huh! You selected no files.');
  });
  $('#file-4').on('filebrowse', function() {
      alert('File browse clicked for #file-4');
  });
  */
  $(document).ready(function() {
      $("#test-upload").fileinput({
          'showPreview' : false,
          'allowedFileExtensions' : ['jpg', 'png','gif'],
          'elErrorContainer': '#errorBlock'
      });
      /*
      $("#test-upload").on('fileloaded', function(event, file, previewId, index) {
          alert('i = ' + index + ', id = ' + previewId + ', file = ' + file.name);
      });
      */
  });
</script>
<jsp:include page="Layout/_footer.jsp"></jsp:include>