<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<sql:setDataSource var="ds" dataSource="jdbc/EmployeeDB" />
<sql:query sql="select * from GrouponProduct" var="rs" dataSource="${ds}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理</title>
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
        <input type="submit" placeholder="搜尋" name="seachbtn" value="搜尋"></form>
    </nav>
    <div style="width:400px;margin:0 auto;margin-top:50px">
    	<form action="./ProServlet" method="post">
    	<input type="text" placeholder="商品名稱" name="productname">
    	<input type="submit" value="查詢" name="queryname"><br><br>
    	<input type="text" placeholder="商品編號" size="6" name="productid">
    	<input type="submit" value="查詢" name="query">
    	<a href="Manage-add.jsp"><input type="button" value="新增"></a>
    	<input type="submit" value="修改" name="updata">
    	<input type="submit" value="刪除" name="delete">
    	</form>
    </div>
    <table border="1">
    	<th>編號</th>
        <th>團主</th>
        <th>商品</th>
        <th>原價</th>
        <th>折扣</th>
        <th>優惠價</th>
        <th>上架日</th>
        <th>截止日</th>
        <th>剩餘數量</th>
        <th>資訊</th>
        <th>成團</th>
        <th>商品管理</th>
    <c:forEach var="row" items="${rs.rows}">
        <tr>
    <td>${row.id}</td>
    <td>${row.leader}</td>
    <td>${row.productName}</td>
    <td>${row.price}</td>
    <td>${row.discount}</td>
    <td>${row.newprice}</td>
    <td>${row.date}</td>
    <td>${row.deadline}</td>
    <td>${row.quantity}</td>
    <td><a href="Intelligence-product.jsp?id=${row.id}">商品</a></td>
    <td>${row.state}</td>
    <td><a href="Manage-state-T.jsp?id=${row.id}"><Button class="sgbtn">顯示</Button></a>
    <a href="Manage-state-F.jsp?id=${row.id}"><Button class="sgbtn">隱藏</Button></a>
    <a href="Manage-delete.jsp?id=${row.id}"><Button class="sgbtn">刪除</Button></a></td>
    </tr>
    </c:forEach>
    </table>
</body>

</html>