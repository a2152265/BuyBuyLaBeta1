<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品管理</title>
<style>
    body {
      font-family: "微軟正黑體";
      background-color: rgb(203, 218, 218);
      
    }
    
 table,td{
   border: 1px solid #bbb;
    border-collapse: collapse;
    width:auto;
    height:50px;
    text-align: center;
    margin:auto;
    padding: 10px;
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
  .div1{
   text-align: center;
   margin-top: 50px;
  }
  
 a:link{
  color:#dd99b3;
 } 
 
 a:visited{
  color:#9dbdc8;
 }
 
 a:hover {
  color: rgb(203, 218, 218);
 }
 a:active {
  color: aliceblue;
 }
 .wrap {
       text-align: center;
   margin-top: 50px;
}

.button {
  width: 140px;
  height: 45px;
  font-family: 'Roboto', sans-serif;
  font-size: 11px;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 500;
  color: #000;
  background-color: #fff;
  border: none;
  border-radius: 45px;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease 0s;
  cursor: pointer;
  outline: none;
  }

.button:hover {
  background-color: #33779e;
  color: #fff;
  transform: translateY(-7px);
}
 form {
      background-color: rgb(255, 255, 255, 0.8);
      margin: 20px auto;
      width:auto;
      padding: 80px;
      /* border-radius: 20px; */
      box-shadow: 0 10px 10px 0 rgba(177, 175, 175, 0.2);
    }

</style>
</head>
<body>
<%  
try {  
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");  ////驅動程式名
String url = "jdbc:sqlserver://localhost:1433;databaseName=BuyBuy"; //資料庫名
String username = "sa";  //資料庫使用者名稱
String password = "password";  //資料庫使用者密碼
Connection conn = DriverManager.getConnection(url, username, password);  //連線狀態
if(conn != null){  
out.print("");        
Statement stmt = null;  
ResultSet rs = null;  
String sql = "SELECT * FROM PRODUCT;";  //查詢語句
stmt = conn.createStatement();  
rs = stmt.executeQuery(sql);  
%>
<h1>商品管理</h1>
<form>
<table>
<tr>
<td>商品代碼</td>
<td>商品名稱</td>
<td>商品分類</td>
<td>商品價格</td>
<td>商品數量</td>
<td>商品資訊</td>
<td>刪除</td>
<td>修改</td>
</tr>

<%
while (rs.next()) {  
%> 
<tr>

<td>
<%
out.println(rs.getString("PID")); //將查詢結果輸出 
%>
</td>

<td style="width:20%">
<%
out.println(rs.getString("P_Name"));
%>
</td>

<td>
<%
out.println(rs.getString("PC_ID"));
%>
</td>

<td>
<% 
out.println("$"+rs.getString("P_Price"));
%>
</td>

<td>
<% 
out.println(rs.getString("P_cnt"));
%>
</td>

<td style="width:40%">
<% 
out.println(rs.getString("P_info"));
%>
</td>

<td>
 <a href="./DelServlet?pid=<%=rs.getString("PID")%>">刪除</a>
</td>
<td>
<a href="./UpdateServlet?pid=<%=rs.getString("PID")%>">修改</a>
</td>
<% 
}  
%> 
</tr>
<%
}else{  
out.print("連線失敗！");  
}  
}catch (Exception e) {        
//e.printStackTrace();  
out.print("資料庫連線異常！");  
}  
%>
</table>
</form>
<div class="wrap">
  <button type="submit" name="add"  id= "add" value="新增" class="button">新增</button>
  <button type="submit" name="select"  id= "select" value="查詢" class="button">查詢</button>
  <button type="submit" name="return"  id= "return" value="首頁" class="button">首頁</button>
</div>

<%-- 
<div class="div1">
<input type="submit" name="add"  id= "add" value="新增"  >
<input type="submit" name="select"  id= "select" value="查詢"  >
</div>
--%>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>

document.getElementById("add").addEventListener("click",function(){
 window.location.href="./InsertProduct.jsp";
});


document.getElementById("select").addEventListener("click",function(){
 window.location.href="./SelectProduct.jsp";
});

document.getElementById("return").addEventListener("click",function(){
 window.location.href="./TotalHome.jsp";
});

</script>

</body>
</html>