<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
h2 {
	margin-left: 20px;
}

div {
	border: 1px solid lightblue;
	margin: 10px;
	margin-top: 10px;
}

.im {
	float: left;
	border: 1px solid lightblue;
	/* margin-left: 100px; */
	width: 100px;
	height: 100px;
}

img {
	text-align: center;
	line-height: 50px;
	width: 100px;
	height: 100px;
}

.ss {
	margin-left: 153px;
}

span {
	margin-right: 20px;
}
</style>
</head>
<body>
	<h2>活動資訊</h2>
	<form action=".\RegisterFormServlet" method="post"
		enctype="multipart/form-data">
		<div>
			<div class="st1" >
                    <img src="" width="100" height="100" alt="123">
                </div>
                <div class="st1">
                    <!-- <label for="" class="t1">照片:</label> -->
                    <input type="file" name="image">
                </div>
			<div class="ss">
				<span>網址</span><input type="text" name="url" size="120"
					maxlength="120">
			</div>
			<div>
				<span>活動名稱</span><input type="text" name="name" size="10"
					maxlength="10">
			</div>
			<div>
				<span style="vertical-align: top">活動描述</span>
				<textarea name="description" rows="6" cols="40"></textarea>
			</div>
			<div class="ss">
				<span style="vertical-align: top">備註</span>
				<textarea name="note" rows="3" cols="40"></textarea>

			</div>
			<div
				style="margin: 0 auto; text-align: center; width: 86px; display: flex;">
				<input type="submit" name="submit" value="新增">
	</form>


	<form action=".\main.jsp" method="post">
		<button class='btn btn-default' type='submit' value='submit'>
			<i class="fas fa-search"></i>返回
		</button>
	</form>
	</div>



	</div>





	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script>
		
	</script>

	<script type="text/javascript">
		var x = FileReader;
		document.forms[0].elements[0].onchange = function() {
			x.readAsDataURL(this.files[0]);
		}
		x.onloadend = function() {
			document.images[0].src = this.result;
		}
	</script>


</body>
</html>