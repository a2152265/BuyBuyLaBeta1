<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品新增確認</title>
<style>
    body {
      font-family: "微軟正黑體";
      background-color: rgb(203, 218, 218);
      align-items: center;
      justify-content: center;
      position: relative;
    }
 table{
  margin:auto;
  border-collapse: collapse;
  border-radius: 10px;
  
 }
 .td1{
  width:100px
 }
 .td2{
  width:300px
 }
 td{
  text-align: center;
 }
 center{
  margin:50px;
 }
  form {
      background-color: rgb(255, 255, 255, 0.8);
      margin: 20px auto;
      max-width: 600px;
      padding: 80px;
      /* border-radius: 20px; */
      box-shadow: 0 10px 10px 0 rgba(177, 175, 175, 0.2);
    }
       table {
      border: 1px solid rgba(147, 156, 165, 0.2);
      border-radius: 20px;
      border-collapse: collapse;
      margin: auto;
      width: 600px;
      height: 400px;
      text-align: center;
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
    

</style>
</head>
<body>
<%-- String[] vehicles; --%>
<jsp:useBean id="pro_bean" class="Product.ProductBean" scope="session" />
<h1>
商品資訊如下
</h1>
<form action="./ProductServlet" method="post">
<table  cellspacing="2" cellpadding="1" border="1" >
<tr>
    <td class="td1" >商品代碼</td>
    <td class="td2">
    <jsp:getProperty name="pro_bean" property="proId" /> 
    </td>
</tr>
<tr >
    <td class="td1">商品名稱</td>
    <td class="td2"><jsp:getProperty name="pro_bean" property="proName" /></td>
</tr>
<tr >
    <td class="td1" >商品類別</td>
    <td class="td2">
    <jsp:getProperty name="pro_bean" property="pcID" /> 
    </td>
</tr>
<tr>
    <td class="td1">商品價格</td>
    <td class="td2"><jsp:getProperty name="pro_bean" property="proPrice" /></td>
</tr>
<tr>
    <td class="td1" >商品數量</td>
    <td class="td2"><jsp:getProperty name="pro_bean" property="proAccount" /> </td>
</tr>

<tr >
    <td class="td1">商品資訊</td>
    <td class="td2"><jsp:getProperty name="pro_bean" property="proInfo" /></td>
</tr>

<tr >
    <td class="td1">商品圖片</td>
    <td class="td2"><jsp:getProperty name="pro_bean" property="proImage" /></td>
</tr>



</table>
 <div class="wrap">
   <button type="submit" name="confirm" class="button">送出</button>
 </div>


</form>

</body>
</html>