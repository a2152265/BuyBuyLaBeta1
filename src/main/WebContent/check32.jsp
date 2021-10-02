<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>報名資料確認</title>
<link rel="stylesheet" href="style.css">
</head>

<body>
<jsp:useBean id="add_form" class="pro.ProBean" scope="session" />
<br><br>
<h1 style="width:270px;margin:0 auto;">資料如下請確認</h1>
<form action="./ProServlet" method="post">
<table  cellspacing="2" cellpadding="1" border="1" width="40%">
<tr>
    <td>團主:</td>
    <td><jsp:getProperty name="add_form" property="leader" /></td>
</tr>
<tr>
    <td>商品名稱:</td>
    <td><jsp:getProperty name="add_form" property="productName" /></td>
</tr>
<tr>
    <td>數量:</td>
    <td><jsp:getProperty name="add_form" property="quantity" /></td>
</tr>
<tr>
    <td>原價:</td>
    <td><jsp:getProperty name="add_form" property="price" /></td>
</tr>
<tr>
    <td>折扣:</td>
    <td><jsp:getProperty name="add_form" property="discount" /> 折</td>
</tr>
<tr>
    <td>優惠價:</td>
    <td><jsp:getProperty name="add_form" property="newprice" /></td>
</tr>
<tr>
    <td width="150">申請日期:</td>
    <td><jsp:getProperty name="add_form" property="date" /></td>
</tr>
<tr>
    <td width="150">截止日:</td>
    <td><jsp:getProperty name="add_form" property="deadline" /></td>
</tr>
</table>
<br><br>
<center>
<input type="submit" name="confirm" value="確認" >
<a href="./Intelligence32.jsp"><input type="button" value="取消"></a>
</center>
</form>
</body>
</html>