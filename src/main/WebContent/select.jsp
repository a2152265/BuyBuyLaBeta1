<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   fieldset {
            width: 420px;
            margin: auto;
            border: 3px solid red;
            border-radius: 20px;
            text-align: center;
        }

        legend {
            color: black;
            font-size: 200%;
            text-align: center;

        }
        button{
        border:border: 10px solid red;
        font-size: 100%;
        }

</style>
</head>
<body>
<form action=".\UserServlet" method="post">
 <fieldset>
        <legend><em>購物紀錄查詢</em></legend>
<h3>請輸入要查詢的帳號:<input type="text" name="user"></h3>
<a href="user.jsp"><button name="select" value="確認送出">確認送出</button></a>
</fieldset>
</form>
</body>
</html>