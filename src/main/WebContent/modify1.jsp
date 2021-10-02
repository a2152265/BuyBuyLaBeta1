<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<% response.setContentType("text/html;charset=UTF-8");
	response.setHeader("Cache-Control", "no-cache" ); // HTTP 1.1
    response.setHeader("Pragma", "no-cache" ); // HTTP 1.0 
    response.setDateHeader("Expires", -1); // Prevents caching at the proxy server 
%>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <style>
        h2 {
            margin-left: 20px;
        }

        div {
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


        }

        img {
            text-align: center;
            line-height: 50px;
            width: 100px;
            height: 100px;
        }

        .ss {
            margin-left: 153px;
        }

        span {

            margin-right: 20px;
        }
    </style>
</head>

<body>
    <h2>修改活動</h2>
    <form action=".\ModifyServlet2" id="form1" method="post" enctype="multipart/form-data">
        <div>
            <div>
                <span>活動編號</span><input type="text" name="id" size="3" maxlength="3" required="true">
            </div>
            <!-- <div style="text-align: center;">
                <input type="submit" name="submit" value="修改" >
            </div> -->

            <div style="margin:0 auto;text-align: center; width:86px ;display:flex;">
                <input type="submit" name="submit" value="確認" >
                </form>
            
            
            <form action=".\main.jsp" method="post" >
                <button class='btn btn-default' type='submit' value='submit' >
                    <i class="fas fa-search"></i>返回
                </button>
            </form>
            </div>



        </div>
    

    <script type="text/javascript">
        var x = new FileReader;
        document.forms[0].elements[0].onchange = function () {
            x.readAsDataURL(this.files[0]);
        }
        x.onloadend = function () {
            document.images[0].src = this.result;
        }


   		 </script>
	

</body>

</html>