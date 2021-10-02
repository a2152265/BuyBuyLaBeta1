<%@page import="Product.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品修改資訊</title>
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
       input,
    textarea,
    select {
      border: 1px solid rgb(155, 153, 153, 0.4);
      background-color: rgb(203, 218, 218, 0.2);
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
<% 
   ProductBean p=(ProductBean)session.getAttribute("Pro_Bean");
 %>
 <h1 class="p">商品修改資訊</h1>
 <div>
 <form  name="frm1" action="./EditServlet">
 <input type="hidden" name="proId" id="proId" value="<%=p.getProId() %>"/>
 <table 
 rules="all">
 <tr>
  <td>商品代號</td>
  <td> 
   <%=p.getProId() %>
 </td> 
 </tr>
  <tr>
  <td>商品名稱</td>
  <td> 
  <label for="proName"></label>
    <input type="text" name="proName" id="proName"  value="<%=p.getProName() %>"/>
  </td> 
 </tr>
 

  <tr>
  <td>商品類別</td>
   <td>
    <label><input type="radio" name="Categories" id="Categories" value="<%=p.getPcID() %>" checked />預設</label> 
  <label> <input class="option-input radio" type="radio" name="Categories" id="Categories1 "value="防疫商品">防疫商品</label> 
 <label> <input class="option-input radio" type="radio" name="Categories" id="Categories2 "value="生活用品">生活用品</label>
 <label> <input class="option-input radio" type="radio" name="Categories" id="Categories3 "value="手機周邊">手機周邊</label>
 <label> <input class="option-input radio" type="radio" name="Categories" id="Categories4 "value="異國商品">異國商品</label>
 <label> <input class="option-input radio" type="radio" name="Categories" id="Categories5 "value="男女衣著">男女衣著</label>
   
   </td>
   </tr>
   
   
   <tr>
   <td>商品價格</td>
   <td>
    <input type="text" name="proPrice" id="proPrice"  value="<%=p.getProPrice()%>"/>
   </td>
   </tr>
   
   <tr>
   <td>商品數量</td>
   <td>
     <input type="text" name="proCnt" id="proCnt"  value="<%=p.getProAccount() %>"/>
   </td>
   </tr>
   
   <tr>
   <td>商品圖片</td>
   <td>
     <input type="text" name="proImg" id="proImg"  value="<%=p.getProImage() %>"/>
   </td>
   </tr>
   
   
   <tr>
   <td>商品資訊</td>
   <td>
     <textarea name="proInfo" id="proInfo" rows="10" cols="30"  ><%=p.getproInfo() %></textarea>
   </td>
   </tr>
   

   
 </table>



 
 <p>&nbsp;</p>
 <%-- <input type="submit" value="確定"/>
  <input type="submit" id="return" value="返回"/>--%>
<div class="wrap">
  <button type="submit"  value="確定" class="button">確定</button>
  <button type="submit" name="return"  id= "return" value="返回" class="button">返回</button>
</div>


 </form>
  </div>
  

  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>

document.getElementById("return").addEventListener("click",function(){
 window.location.href="./AllProduct.jsp";
});

</script>
 </body>
 </html>