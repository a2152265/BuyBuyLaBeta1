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
		font-weight:bolder;
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
      	
		margin-right: 20px;
	}
	.return{
		margin: 0 auto;
		width:50px;
		height:30px;
		text-align: center;
	}
</style>
</head>
<body>
	<jsp:useBean id="reg" class="mvc.bean.CampaignBean" scope="session" />
	
	<!-- <jsp:getProperty name="reg" property="id" /><br>
    <img src="data:image/jpg;base64,${sessionScope.base64Img}" style="width: 100px;height: 100px;"><br>
	<jsp:getProperty name="reg" property="name" /><br>
	<jsp:getProperty name="reg" property="note" /><br> -->

    <div>
        <div class="im">
            <a href="<jsp:getProperty name="reg" property="url"/>"target="_blank"><img src="data:image/jpg;base64,${sessionScope.base64Img}" width="100" height="100" ></a>
            <span>&nbsp;&nbsp;&nbsp;&nbsp;活動圖片</span>
        </div>

        <div>
        	
            <span>編號&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<jsp:getProperty name="reg" property="id" /></span>
            
            </div>
        
    <div >
    <span style="vertical-align:top">網址&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><jsp:getProperty name="reg" property="url"/>
    </div>
    <div>
        <span>活動名稱</span><jsp:getProperty name="reg" property="name" />
    </div>
    <div>
    <span style="vertical-align:top">活動描述</span><textarea name="note" rows="3" cols="40"><jsp:getProperty name="reg" property="description"/></textarea>
    </div>
    <div class="ss" >
        <span style="vertical-align:top">備註</span><textarea name="note" rows="3" cols="40"><jsp:getProperty name="reg" property="note"/></textarea>
    </div>
	<div class="return">
	<form action=".\search.jsp" method="post" >
		
		<button class='btn btn-default' type='submit' value='submit' >
			返回
		</button>
		
	</form>
</div>


</body>
</html>