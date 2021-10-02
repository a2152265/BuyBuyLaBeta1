<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
		<meta charset="utf-8" />
		<title>商品列表</title>
		<!--商品列表样式表-->
		<link rel="stylesheet" type="text/css" href="test.css" />
		<!--cookie操作的js库-->
		<script src="cookie.js" type="text/javascript" charset="utf-8"></script>
	</head>
<body>
 
<sql:setDataSource var="snapshot" driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
     url="jdbc:sqlserver://localhost:1433;databaseName=BuyBuy"
     user="sa"  password="password"/>

<sql:query dataSource="${snapshot}" var="result">
SELECT * from PRODUCT;
</sql:query>
 <div class="container">
			<h1>商品列表</h1>
			<div class="mycar">
				<a href="cart.jsp">我的購物車</a><i id="ccount">0</i>
			</div>

<div class="list">
<c:forEach var="row" items="${result.rows}">

				<dl pid="${row.PID}">
					<dt>
						<img src="${row.P_img}" />
					</dt>
					<dd>商品名稱:<span>${row.P_Name}</span></dd>
					
					<dd>NT<span>${row.P_price}</span></dd>
					<dd>
						<button>加入購物車</button>
					</dd>
				</dl>
			
</c:forEach>
</div>
	<script type="text/javascript" src="server.js"></script>
		<!--
        	描述：本页面的js操作
        -->
		<script type="text/javascript" src="test.js"></script>
</body>


</html>