<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page import="mvc.bean.loginBean"%>

<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>會員帳號管理</title>
    <link rel="icon" href="favicon.ico" type="image/x-icon" />
<style>
	  body {
      font-family: "微軟正黑體";
      background-color: rgb(203, 218, 218);
      align-items: center;
      justify-content: center;
      position: relative;
    }
	 h1 {
      background-color: #f7f7f7;
      /* 告訴電腦背景顏色 */
      padding: 18px 0 16px 22px;
      /* 告訴電腦內距要多大 */
      border-left: 8px solid #33779e;
      /* 告訴電腦左邊框要多寬、跟顏色 */
      color: #333 !important;
      /* 告訴電腦文字顏色 */
      width: 300px;
    }
     form {
      background-color: rgb(255, 255, 255, 0.8);
      margin: 20px auto;
      max-width: 800px;
      padding: 80px;
      /* border-radius: 20px; */
      box-shadow: 0 10px 10px 0 rgba(177, 175, 175, 0.2);
    }
      table {
      border: 1px solid rgba(147, 156, 165, 0.2);
      border-radius: 20px;
      border-collapse: collapse;
      margin: auto;
      width: 800px;
      height: 400px;
      text-align: center;
    }
       input,
    textarea,
    select {
      border: 1px solid rgb(155, 153, 153, 0.4);
      background-color: rgb(203, 218, 218, 0.2);
    }
    
.wrap {
	margin-top: -145px;
	margin-left: -30px;
	text-align: center;
}

a {
	-webkit-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-moz-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-ms-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-o-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	display: block;
	margin: 40px auto;
	max-width: 180px;
	text-decoration: none;
	border-radius: 4px;
	padding: 20px 30px;
}

a.button {
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
}

a.button:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
}

a.button2 {
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
}

a.button2:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7) 0 80px 0px 2px inset;
}
    


</style>
</head>
<body>
    <jsp:useBean id="reg_student" class="mvc.bean.loginBean" scope="session" />


 <h1 class="p">我的帳戶</h1>

 <div>
    <form action=".\RegisterServlet" method="post">
 <table rules="all">
 
    <div class="divFocus">
        <b style="font-size: 30px;">刪除帳號</b><br><br>
        <span>將帳號刪除後您將不能使用該帳號</span>
        <hr><br><br>
        <span class="spFocus" >欲刪除帳號 : 
               <jsp:getProperty name="reg_student" property="emailLogin" />       
                                                        
        </span><br><br>
        
        <input type="submit" style="font-size: 35px;" id="submitDelete" name="submitDelete" value="確定刪除"">

    </div>
 </table>

 <p>&nbsp;</p>
 </form>
 
 
 <div class="wrap">
  		<a href="#" class="button" name="return"  id= "return" >返回</a>
	</div>

  </div>
  

  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>

document.getElementById("return").addEventListener("click",function(){
	window.location.href="./UserLogin.jsp";
});

</script>
 </body>
 </html>
