<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div{
        display: flex;
    	width:480px;
        border: lightblue 3px solid;
        margin:0  auto;
    }
</style>
</head>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<body>
    <h2 ALIGN="center">活動查詢</h2>
    <div>
        <form action=".\search.jsp" method="post" >
       
            <button class='btn btn-default' type='submit' value='submit' style="width:120px;height:50px;font-size:30px;">
                <i class="fas fa-search"></i>查詢
            </button>
        
    </form> 
    <form action=".\campaign.jsp" method="post" >
    
        <button class='btn btn-default' type='submit' value='submit' style="width:120px;height:50px;font-size:30px;">
            <i class="fas fa-plus-square"></i>新增
        </button>
   
    </form>
    
    
    <form action=".\modify1.jsp" method="post" >
        
            <button class='btn btn-default' type='submit' value='submit' style="width:120px;height:50px;font-size:30px;">
                <i class="fas fa-pencil-alt"></i>修改
            </button>
        
    </form>
    <form action=".\delete36.jsp" method="post" >
        
            <button class='btn btn-default' type='submit' value='submit' style="width:120px;height:50px;font-size:30px;">
                <i class="fas fa-trash-alt"></i>刪除
            </button>
        
     </form>
    </div>
   
</body>
</html>