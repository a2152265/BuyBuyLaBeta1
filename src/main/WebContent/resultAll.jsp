<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h2 {
	margin-left: 20px;
}

div {
	/* font-family:微軟正黑體; */
	border: 1px solid lightblue;
	margin: 10px;
	margin-top: 10px;
}

.im {
	float: left;
	border: 1px solid lightblue;
	/* margin-left: 100px; */
	width: 100px;
	height: 100px; 
	text-align: center;
}
/* img{
		text-align: center;
		line-height: 50px;
		width:100px;
		height:100px;
	} */
.ss {
	margin-left: 153px;
}

span {
	font-weight: bolder;
	margin-right: 20px;
}

.return {
	margin: 0 auto;
	width: 45px;
	height: 25px;
	text-align: center;
}

.outside {
	border-radius: 20px;
	border: 3px solid lightblue;
}
</style>
</head>
<body>
	<%-- 	<jsp:useBean id="list" class="mvc.bean.CampaignBean" scope="session" /> --%>
	<%-- 	<c:forEach items="${sessionScope.list}" var="u" > --%>
	
	<c:choose>
		<c:when test="${sessionScope.list.size()!=0}">
			<c:forEach var="i" begin="0" end="${sessionScope.list.size()-1}">
				<div class="outside">
					<div class="im">
						<a href="${list.get(i).url}" target="_blank"><img
							src="data:image/jpg;base64,${imgList.get(i)}"
							style="width: 100px; height: 100px;"></a> <span>&nbsp;&nbsp;&nbsp;活動圖片</span>
					</div>

					<div>

						<span>編號&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${list.get(i).id}</span>

					</div>
					<div>
						<span style="vertical-align: top">網址&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${list.get(i).url}</span>
					</div>

					<div>
						<span>活動名稱</span>${list.get(i).name}
					</div>
					<div>
						<span style="vertical-align: top">活動描述</span>
						<textarea name="note" rows="3" cols="40">${list.get(i).description}</textarea>
					</div>
					<div class="ss">
						<span style="vertical-align: top">備註</span>
						<textarea name="note" rows="3" cols="40">${list.get(i).note}</textarea>
					</div>
				</div>
			</c:forEach>
		</c:when>
			<c:otherwise>
				<c:out value="無資料"></c:out>
			</c:otherwise>
		
	</c:choose>

	<div class="return">
		<form action=".\search.jsp" method="post">
			<button class='btn btn-default' type='submit' value='submit'>
				<i class="fas fa-search"></i>返回
			</button>
		</form>
	</div>


</body>
</html>