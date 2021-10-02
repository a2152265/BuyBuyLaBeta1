<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<style>
    div{
    	 text-align:center; 
        /* border: lightblue 3px solid; */
    	/* width: 1000px; */
        /* padding-top:500px ;  */
        margin: auto;
    }

</style>
</head>
<body>
	<!-- <div>
    <form action=".\main.jsp" method="post" >
        <button class='btn btn-default' type='submit' value='submit' >
            <i class="fas fa-search"></i>返回
        </button>
    </form>
	</div> -->

    <script>
        Swal.fire({
      position: 'center',
      icon: 'success',
      title: '修改成功',
      text: '即將跳轉至首頁',
      showConfirmButton: false,
      timer: 3000
      })
   
      setTimeout("location.href='\main.html'",3000)

</script>
</body>
</html>