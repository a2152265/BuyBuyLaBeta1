<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<sql:setDataSource var="ds" dataSource="jdbc/EmployeeDB" />
<% String query=request.getSession(true).getAttribute("productid").toString(); %>
<sql:query sql="select * from GrouponProduct where id ='${productid}'" var="rs" dataSource="${ds}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改商品</title>
<link rel="stylesheet" href="style.css">
<style>
input[type="file"] {
	position: fixed;
	right: 100%;
	bottom: 100%;
}

.custom-file-upload {
	border: 1px solid #ccc;
	display: inline-block;
	padding: 6px 12px;
	cursor: pointer;
}
img{float=none;}
</style>
</head>
<body>
	<div class="divform">
		<h1>修改商品</h1>
		<form action="./ProServlet">
		<c:forEach var="row" items="${rs.rows}">
			<!-- 團主名稱 -->
			<strong>團主名稱 </strong>
			<input type="text" value="${row.leader}" class="leader" name="leader" placeholder="請輸入名字">
			<span class="spleader"></span><br><span class="spanText">(1.不可空白2.至少兩個字3.不能有特殊符號)</span><br>
			
			<!-- 商品名稱 -->
			<strong>商品名稱 </strong><input type="text" value="${row.productname}" required name="productName" class="productname" placeholder="商品名稱">
			<span class="spproductname"></span><br><br>
			
			<!-- 原價 -->
			<strong>原價 </strong><input type="text" value="${row.price}" required class="price" maxlength="6" name="price" size="3">
			
			<!-- 數量 -->
			<strong>數量 </strong><input type="text" value="${row.quantity}" required name="quantity" maxlength="3" class="quantity" size="3"><br>
			
			<!-- 折扣 -->
			<strong>折扣 </strong><input type="text" value="${row.discount}" required class="discount" maxlength="2" name="discount" size="3" placeholder="　　折">
			<span class="spdiscount"></span><br> 
			
			<!-- 優惠價 -->
			<strong>優惠價 </strong><input type="text" value="${row.newprice}" class="newprice" name="newprice" size="3" readonly><br>
			
			<!-- 日期 -->
			<strong>日期 </strong><input type="date" name="date" size="4" id="dt" readonly><br><br>
			
			<!-- 截止日 -->
			<strong>截止日 </strong><input type="date" name="deadline" required size="4" id="dt" ><br><br>
			
			<!-- 圖片 -->
			<label for="file-upload" class="custom-file-upload"><i class="fa fa-cloud-upload"></i> 圖片上傳</label> 
			<input id="file-upload" type="file" name="img" /><br><br> 
			
			<input type="submit" id="sbtn" name="updatabtn" style="margin-top: 50px;" class="sgbtn">
			<a href="Home.jsp"><input type="button" id="sbtn" name="cancel" class="sgbtn" value="取消"></a>
			</c:forEach>
		</form>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
    	document.getElementById("dt").valueAsDate = new Date();

	$(function(){
		// 優惠價計算
		$('.price,.discount').on('change blur focus',function(){
		if($('.discount').val()<10){
			$('.newprice').val(parseInt($('.price').val()*$('.discount').val()/10));
			$('.spdiscount').html('');
		}else if($('.discount').val()>10&&$('.discount').val()<100){
			$('.newprice').val(parseInt($('.price').val()*$('.discount').val()/100));
			$('.spdiscount').html('');
		}else{
			$('.spdiscount').html("<img style='width:15px' src='https://cdn-icons-png.flaticon.com/128/753/753345.png'>格式錯誤");
		}
		});
		// 團主姓名驗證
			$('.leader').on('blur',function(){
		let leaderval = $('.leader').val();
		let leaderlen = leaderval.length;
		if(leaderlen==0){
			$('.spleader').html("<img style='width:15px' src='https://cdn-icons-png.flaticon.com/128/753/753345.png'>不可空白")
		}else if(leaderlen<2){
			$('.spleader').html("<img style='width:15px' src='https://cdn-icons-png.flaticon.com/128/753/753345.png'>長度不足")
		}else if(leaderlen>1){
			for(let i=0;i<leaderlen;i++){
				let ch = leaderval.charCodeAt(i);
 				if (ch >= 0x4e00 && ch <= 0x9fff) {flag = true;}
 				else {flag = false; break;}
			}
			if (flag){$('.spleader').html("<img style='width:15px' src='https://cdn-icons-png.flaticon.com/128/1828/1828640.png'>")}
			else {$('.spleader').html("<img style='width:15px' src='https://cdn-icons-png.flaticon.com/128/753/753345.png'>格式錯誤")}
		}
	});
		// 產品名稱不能為空
		$('.productname').on('blur',function(){
				let productname = $('.productname').val();
				if(productname.length==0){
			$('.spproductname').html("<img style='width:15px' src='https://cdn-icons-png.flaticon.com/128/753/753345.png'>不可空白")
				}else{
			$('.spproductname').html("<img style='width:15px' src='https://cdn-icons-png.flaticon.com/128/1828/1828640.png'>")
				}
	});
	})
	</script>
</body>
</html>