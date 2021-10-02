<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<sql:setDataSource var="ds" dataSource="jdbc/EmployeeDB" />
<% String id= request.getParameter("id");
request.getSession(true).setAttribute("id", id);%>
<sql:query sql="select * from GrouponProduct where id ='${id}'" var="rs" dataSource="${ds}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>團購情報</title>
<link rel="stylesheet" href="style.css">
<style>
.qty {
  width: 40px;
  height: 35px;
  text-align: center;
  border: 0;
  border-top: 1px solid #aaa;
  border-bottom: 1px solid #aaa;
}
input.qtyplus {
  width: 25px;
  height: 35px;
  border: 1px solid #aaa;
  background: #f8f8f8;
}
input.qtyminus {
  width: 25px;
  height: 35px;
  border: 1px solid #aaa;
  background: #f8f8f8;
}
</style>
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
 <c:forEach var="row" items="${rs.rows}">
 		<div style="width:1000px;height:500px;margin:0 auto;padding:100px;margin-top:10px;">
	    <img style="width:300px;float:left;margin-right:20px;" src="data:image/png;base64,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">
    	<span style="font-size:30px">${row.productname}</span><br><br><br>
    	團購價<span class="newpriceShow">${row.newprice}</span>元<br>
    	(原價<span class="priceShow">${row.price}</span>元,<span class="newpriceShow">${row.discount}</span>折)<br>
    	使用日期 : ${row.date}~${row.deadline}<br><br><br><br>
    	    <input type='button' value='-' class='qtyminus' field='quantity' />
   <input type='text' name='quantity' value='0' class='qty' /><input type='button' value='+' class='qtyplus' field='quantity' />
    	<div style="float:right;"><input type="button" value="購買" style="margin-right:10px"><input type="button" value="收藏"></div>
    	<br><br><br><br><br><br>
    	<p style="background-color:yellow;text-align: center;">討論</p>
    	0則留言<hr><textarea cols="50" rows="5" placeholder="輸入你想要寫的內容..."></textarea><br>
    	<input type="button" value="發佈">
    	</div>
    </c:forEach>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script>
    $(function() {
    	  // This button will increment the value
    	  $('.qtyplus').click(function(e) {
    	    // Stop acting like a button
    	    e.preventDefault();
    	    // Get the field name
    	    fieldName = $(this).attr('field');
    	    // Get its current value
    	    var currentVal = parseInt($('input[name=' + fieldName + ']').val());
    	    // If is not undefined
    	    if (!isNaN(currentVal)) {
    	      // Increment
    	      $('input[name=' + fieldName + ']').val(currentVal + 1);
    	    } else {
    	      // Otherwise put a 0 there
    	      $('input[name=' + fieldName + ']').val(0);
    	    }
    	  });
    	  // This button will decrement the value till 0
    	  $(".qtyminus").click(function(e) {
    	    // Stop acting like a button
    	    e.preventDefault();
    	    // Get the field name
    	    fieldName = $(this).attr('field');
    	    // Get its current value
    	    var currentVal = parseInt($('input[name=' + fieldName + ']').val());
    	    // If it isn't undefined or its greater than 0
    	    if (!isNaN(currentVal) && currentVal > 0) {
    	      // Decrement one
    	      $('input[name=' + fieldName + ']').val(currentVal - 1);
    	    } else {
    	      // Otherwise put a 0 there
    	      $('input[name=' + fieldName + ']').val(0);
    	    }
    	  });
    	});</script>
</body>
</html>