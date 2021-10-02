<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查詢商品</title>
</head>
<style>
body {
       background-color: rgb(203, 218, 218);
 font-family: Helvetica,Arial,Verdana;

}
h1 {
 color: #33779e;
 text-align: center;
}
.redfamily {
 color: red; 
}
.search-box,.close-icon,.search-wrapper {
 position: relative;
 padding: 10px;
}
.search-wrapper {
 width: 600px;
 margin: auto;
 margin-top: 50px;
}
.search-box {
 text-align: center;
 width: 100%;
 border: 1px solid #ccc;
   outline: 0;
   border-radius: 15px;
   
}
.search-box:focus {
 box-shadow: 0 0 15px 5px rgb(199, 214, 199);
 border: 2px solid #bebede;
}


.search-box:not(:valid) ~ .close-icon {
 display: none;
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
<body>
<h1>
 查詢商品
 <br> <span class="redfamily"> 請輸入商品代號查詢 </span>
</h1>
<div class="search-wrapper">
 <form action="./SelectByIdServlet" method="post">
 <input type="text" name="pid"  autocomplete="off" class="search-box">

 <div class="wrap">
    <button class="button" type="submit">查詢</button>
 </div>
 </form>

</div>




</body>
</html>