<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>享購</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<style>

a {
        text-decoration: none;
    }
.navbar1{
        /* position:absolute; */
        /* z-index: 1; */
        padding-top: 100px;
        float: left; 
        border: lightblue 3px solid;
        width: 100px;
        height: 500px;
        text-align: center;
   }
   .navbar2{
    text-align: center;
     /* position: relative; */
       border: lightblue 3px solid;
       height: 500px;
   }
  </style>
</head>
<body>  
 
    <div class="" style="height:30px;border: lightblue 3px solid;padding-left:1100px;font-family:'微軟正黑體';font-weight:normal;">
      <a class="navbar-brand" href="#"><span style="font-size:8px;">會員登入</span></a><a class="navbar-brand" href="#"><span style="font-size:8px;">會員註冊</span></a>
    </div>

  <nav class="navbar navbar-expand-lg navbar-light bg-light"style="border: lightblue 3px solid;padding-left:450px;">
    <a class="navbar-brand" href="#"><span style="font-family:'微軟正黑體';font-weight: bolder;">享購購物</span></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  
      <form class="form-inline my-2 my-lg-0" style="border: lightblue 3px solid;display: flex;">
        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
      </form>
    
  </nav>


  <div class="navbar1" >
      <div style="padding-bottom:25px ;"> <a href="" style="border: lightblue 3px solid;"><span style="font-family:'微軟正黑體';font-weight: bolder;">會員管理</span></a><br> </div>  
      <div style="padding-bottom:25px ;"> <a href="" style="border: lightblue 3px solid;"><span style="font-family:'微軟正黑體';font-weight: bolder;">商品管理</span></a> <br></div>  
        <div style="padding-bottom:25px ;"><a href="" style="border: lightblue 3px solid;"><span style="font-family:'微軟正黑體';font-weight: bolder;">購物車</span></a> <br></div>  
          <div style="padding-bottom:25px ;" > <a href=""style="border: lightblue 3px solid;"><span style="font-family:'微軟正黑體';font-weight: bolder;">團購網</span></a> <br></div>  
            <div style="padding-bottom:25px ;">  <a href="main.jsp" style="border: lightblue 3px solid;"><span style="font-family:'微軟正黑體';font-weight: bolder;">活動管理</span></a></div>  




</div>



<div  class="navbar2">


</div>


   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
</body>
</html>