<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>成功新增商品</title>
</head>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
@import url('https://fonts.googleapis.com/css2?family=Patrick+Hand&display=swap');
* {
 font-family:"微軟正黑體"
}
.success-page{
  max-width:300px;
  display:block;
  margin: 0 auto;
  text-align: center;
      position: relative;
    top: 50%;
    transform: perspective(1px) translateY(50%)
}
.success-page img{
  max-width:62px;
  display: block;
  margin: 0 auto;
}

.btn-view-orders{
  display: block;
  border:1px solid #47c7c5;
  width:100px;
  margin: 0 auto;
  margin-top: 45px;
  padding: 10px;
  color:#fff;
  background-color:#47c7c5;
  text-decoration: none;
  margin-bottom: 20px;
}
h2{
  color:#47c7c5;
    margin-top: 25px;

}
a{
  text-decoration: none;
}
.header {
 width: 100%;
 height: 80px;
 background: rgb(203, 218, 218);
 color: white;
 font-size: 50px;
 padding-left: 30px;
 position: fixed;
 top: 0;
 z-index: 2;
 font-family: 'Patrick Hand', cursive;
 font-weight:600;
}
</style>
</head>
<body>
 <div class="header">BuyBuyLa</div>
<div class="success-page">
   <img  src="http://share.ashiknesin.com/green-checkmark.png" class="center" alt="" />
  <h2>成功新增商品 !</h2>
  <a href="./AllProduct.jsp" class="btn-view-orders">查詢商品</a>
  <a href="./TotalHome.jsp" class="btn-view-orders">返回首頁</a>
<%--   <a href="#">Continue Shopping</a> --%>
</div>


</body>
</html>