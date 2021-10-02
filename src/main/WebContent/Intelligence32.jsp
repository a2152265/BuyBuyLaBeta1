<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<sql:setDataSource var="ds" dataSource="jdbc/EmployeeDB" />
<sql:query sql="select * from GrouponProduct where state='T'" var="rs" dataSource="${ds}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>團購情報</title>
<link rel="stylesheet" href="style.css">

</head>
<body>
    <nav>
        <a href="Home.jsp">回首頁</a>
        <a href="Intelligence32.jsp">團購情報</a>
        <a href="Manage.jsp">管理</a>
        <a href="">會員中心</a>
        <form action="./ProServlet" method="post" style="display:inline;">
        <input type="text" placeholder="搜尋" name="seach">
        <input type="submit" name="seachbtn" value="搜尋"></form>
    </nav>
    
    <div class="divlist">
    <a href="Manage-add.jsp"><input class="sgbtn" type="button" value="發起團購"></a><br><br>
    <c:forEach var="row" items="${rs.rows}">
    <a href="Intelligence-product.jsp?id=${row.id}"><img style="width:150px;float:left;margin-right:20px;" src="data:image/png;base64,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"></a>
    <a href="Intelligence-product.jsp?id=${row.id}"><span>${row.productName}</span></a><br>
    <span class="newpriceShow">${row.newprice}</span>元
    (原價<span class="priceShow">${row.price}</span>元
    ,<span class="newpriceShow">${row.discount}</span>折)<br><br>
    剩餘數量 ${row.quantity}<br>
    上架日 ${row.date}  截止日 ${row.deadline}
    <br><br>
    <hr>
    </c:forEach>
    </div>
        <div class="box">
        <a href="#">TOP</a>
    </div>
</body>
</html>