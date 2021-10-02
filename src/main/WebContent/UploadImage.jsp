<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品圖片上傳</title>
<style>
        fieldset {
            width: 700px;
            border: 3px solid rgb(203, 218, 218);
            border-radius: 20px;
            background-color: rgb(203, 218, 218);
           	box-shadow: 5px 5px 5px rgb(192, 209, 209);
           	margin:auto;
           	margin-bottom: 50px;
            
        }
		legend {
            font-size: x-large;
            margin-left: 20px;
            font-weight: 800;
            
        }
        .form-group__file {
      display: flex;
      flex-direction: column;
      position: relative;
      width: 100%;
      min-width: 130px;
      height: 180px;
    }

    .file-label {
      margin: 10px 0;
    }

    .file-input {
      opacity: 0;
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      width: 130px;
      height: 180px;
      cursor: pointer;
      z-index: 100;
    }

    .file-preview-background {
      position: absolute;
      bottom: 0;
      left: 0;
      width: 130px;
      height: 140px;
      background-color: #f7f7f7;
      border: 2px dashed #dfdfdf;
      border-radius: 10px;
      text-transform: uppercase;
      font-size: 14px;
      letter-spacing: 3px;
      text-align: center;
      color: #bbb;
      display: flex;
      justify-content: center;
      align-items: center;
      /* z-index: 1; */
    }

    .file-preview {
      width: 120px;
      height: 120px;
      position: absolute;
      top: 46px;
      left: 8px;
      border-radius: 65px;
      z-index: 10;
      object-fit: cover;
      opacity: 0;
      transition: opacity 0.4s ease-in;
    }

</style>
</head>
<body>
<form action="./ImageUploadServlet" method="post" enctype="multipart/form-data">
		<fieldset>
			 <legend>商品照片</legend>
    <div class="form-group__file">
      <label for="imageUpload" class="file-label"></label>
      <div class="file-wrapper">
        <input type="file" name="imageUpload" id="imageUpload" class="file-input" />
        <div class="file-preview-background">添加商品照片</div>
    </div>
     <img src="" id="imagePreview" width="200px" class="file-preview" />
    </div>
		</fieldset>
</form>		
		
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script>
    $('#imageUpload').change(function () {
      readImgUrlAndPreview(this);
    });

    function readImgUrlAndPreview(input) {
      if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
          $('#imagePreview').attr('src', e.target.result);
          $('#imagePreview').css('opacity', 1);
        }
      };
      reader.readAsDataURL(input.files[0]);
    }
    </script>
</body>
</html>