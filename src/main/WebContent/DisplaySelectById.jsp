<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="Product.ProductBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品查詢</title>
<style>
   body {
      font-family: "微軟正黑體";
      background-color: rgb(203, 218, 218);
      align-items: center;
      justify-content: center;
      position: relative;
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
     form {
      background-color: rgb(255, 255, 255, 0.8);
      margin: 20px auto;
      max-width: 800px;
      padding: 80px;
      /* border-radius: 20px; */
      box-shadow: 0 10px 10px 0 rgba(177, 175, 175, 0.2);
    }
      table {
      border: 1px solid rgba(147, 156, 165, 0.2);
      border-radius: 20px;
      border-collapse: collapse;
      margin: auto;
      width: 800px;
      height: 400px;
      text-align: center;
    }
       input,
    textarea,
    select {
      border: 1px solid rgb(155, 153, 153, 0.4);
      background-color: rgb(203, 218, 218, 0.2);
    }
    
.wrap {
 margin-top: -145px;
 margin-left: -30px;
 text-align: center;
}

a {
 
 display: block;
 margin: 40px auto;
 max-width: 180px;
 text-decoration: none;
 border-radius: 4px;
 padding: 20px 30px;
}

a.button {
   width: 100px;
  height: 25px;
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

a.button:hover {
  background-color: #33779e;
  color: #fff;
  transform: translateY(-7px);
}


    


</style>
</head>
<body>
<% 
   ProductBean p=(ProductBean)session.getAttribute("Pro_Bean2");
 %>
 <h1 class="p">商品查詢資訊</h1>
 <div>
 <form  name="frm1">
 <table rules="all">
 <tr>
  <td width="20%">商品代號</td>
  <td width="80%"><%=p.getProId() %></td> 
  
 </tr>
  <tr>
  <td>商品名稱</td>
  <td><%=p.getProName() %></td> 
 </tr>
 
  <tr>
  <td>商品類別</td>
  <td><%=p.getPcID() %></td> 
   </tr>
   
   
   <tr>
   <td>商品價格</td>
   <td><%=p.getProPrice() %></td> 
   </tr>
   
   <tr>
   <td>商品數量</td>
    <td><%=p.getProAccount() %></td> 
   </tr>
   
   <tr>
   <td>商品資訊</td>
   <td><%=p.getproInfo() %></td> 
   </tr>
   
   <tr>
   <td>商品圖片</td>
   <td><%=p.getProImage() %></td> 
   </tr>
   
 </table>



 
 <p>&nbsp;</p>



 </form>
 <%--<input type="submit" name="return"  id= "return" value="返回"  > --%>
 
 
 <div class="wrap">
    <a href="#" class="button" name="return"  id= "return" >返回</a>
 </div>

  </div>
  

  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>

document.getElementById("return").addEventListener("click",function(){
 window.location.href="./AllProduct.jsp";
});

</script>
 </body>
 </html>