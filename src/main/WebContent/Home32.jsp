<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>首頁</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
    <nav>
        <a href="Home32.jsp">回首頁</a>
        <a href="Intelligence.jsp">團購情報</a>
        <a href="Manage.jsp">管理</a>
        <a href="">會員中心</a>
        <form action="./ProServlet" method="post" style="display:inline;">
        <input type="text" placeholder="搜尋" name="seach">
        <input type="submit" name="seachbtn" value="搜尋"></form>
    </nav>
</body>
</html>