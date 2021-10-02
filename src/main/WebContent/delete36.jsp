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
	h2{
		margin-left: 20px;
	}
	div{
		border:1px solid lightblue ;
		margin:10px;
		margin-top:10px;
	
	}
	span{

        margin-right: 20px;
    }
</style>
</head>
<body>
		<h2>刪除活動</h2>
		<form action=".\DeleteServlet" method="post" >
		<div>
			<div>
			<span>刪除活動編號</span><input type="text" name="id" size="3" maxlength="3">
			</div>
			<div>
			<span>刪除所有活動</span><button name="deleteAll">click</button>
			</div>

		<!-- <div style="text-align: center;">
			<input type="submit" name="deleteId" value="刪除" >
			<input type="submit" name="submit" value="返回">
			
		</div>
	 -->



		<div style="margin:0 auto;text-align: center; width:86px ;display:flex;">
			<input type="submit" name="deleteId" value="刪除" >
			</form>
		
		
		<form action=".\main.jsp" method="post" >
			<button class='btn btn-default' type='submit' value='submit' >
				<i class="fas fa-search"></i>返回
			</button>
		</form>
		</div>


	</div>
		</form>
		
</body>
</html>