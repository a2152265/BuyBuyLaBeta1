<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %> 
<%
    response.setContentType("text/html;charset=UTF-8");
    response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
    response.setHeader("Pragma","no-cache"); // HTTP 1.0
    response.setDateHeader ("Expires", -1); // Prevents caching at the proxy server
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h2{
		margin-left: 20px;
	}
	div{
		border:1px solid lightblue ;
		margin:10px;
		margin-top:10px;
	
	}
	.im{
		float: left;
		border:1px solid lightblue ;
		/* margin-left: 100px; */
		width:100px;
		height:100px;
		text-align: center;
		
	}
	/* img{
		text-align: center;
		line-height: 50px;
		width:100px;
		height:100px;
	} */
	.ss{
		margin-left: 153px;
	}
	span{
      
		margin-right: 10px;
	}
</style>
</head>
<body>
	<form action=".\ModifyServlet2" id="form1" method="post" enctype="multipart/form-data">
	<jsp:useBean id="reg" class="mvc.bean.CampaignBean" scope="session" />
	
	<!-- <jsp:getProperty name="reg" property="id" /><br>
    <img src="data:image/jpg;base64,${sessionScope.base64Img}" style="width: 100px;height: 100px;"><br>
	<jsp:getProperty name="reg" property="name" /><br>
	<jsp:getProperty name="reg" property="note" /><br> -->

<div>
	<div class="ss"><input type="file" name="image"></div>
	<div class="im">
		<img src="data:image/jpg;base64,${sessionScope.base64Img}" width="100" height="100" >
		<span>&nbsp;&nbsp;&nbsp;&nbsp;活動圖片</span>
	</div>

	<div class="ss">
		<span  style="vertical-align:top">編號&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><textarea name="id" rows="1" cols="1" ><jsp:getProperty name="reg" property="id" /></textarea>
	</div>
	<div class="ss">
    <span style="vertical-align:top ">網址&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><textarea name="url" rows="3" cols="40"><jsp:getProperty name="reg" property="url"/></textarea>
    </div>
    <div class="ss">
        <span  style="vertical-align:top">活動名稱</span><textarea name="name" rows="3" cols="40"><jsp:getProperty name="reg" property="name" /></textarea>
    </div>
    <div class="ss">
    <span style="vertical-align:top">活動描述</span><textarea name="description" rows="3" cols="40"><jsp:getProperty name="reg" property="description"/></textarea>
    </div>
    <div class="ss" >
        <span style="vertical-align:top">備註&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><textarea name="note" rows="3" cols="40"><jsp:getProperty name="reg" property="note"/></textarea>
    </div>
    
	<div style="margin:0 auto;text-align: center; width:86px ;display:flex;">
		<input type="submit" name="modify"  value="修改" id="btn" >
	</form>

	<form action=".\main.jsp" method="post" >
		<button class='btn btn-default' type='submit' value='submit' >
			<i class="fas fa-search"></i>返回
		</button>
	</form>
	</div>
	</div>
	

	






	<script type="text/javascript">
        var x = new FileReader;
        document.forms[0].elements[0].onchange = function () {
            x.readAsDataURL(this.files[0]);
        }
        x.onloadend = function () {
            document.images[0].src = this.result;
        }
	</script>
</body>
</html>