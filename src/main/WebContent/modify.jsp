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
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
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
    <form action=".\ModifyServlet" id="form1" method="post" enctype="multipart/form-data">
        <div>
            <div class="im">
                <img src="" width="100" height="100" alt="封面圖片">
            </div>
            <div>
                <span>活動圖片</span><input type="file" name="image">
            </div>
            <div>
                <span>活動編號</span><input type="text" name="id" size="3" maxlength="3">
            </div>
            <div>
                <span>活動名稱</span><input type="text" name="name" size="10" maxlength="10">
            </div>
            <div>
                <span style="vertical-align:top">活動描述</span><textarea name="description" rows="6"
                    cols="40"></textarea>
            </div>
            <div class="ss">
                <span style="vertical-align:top">備註</span><textarea name="note" rows="3" cols="40"></textarea>
            </div>
            <div style="text-align: center;">
                <input type="submit" name="submit"  value="修改" id="btn" >
                <input type="button" name="submit" value="返回">
                <button >click</button>
                <button class='btn btn-default' type='submit' value='submit' id="btn" style="width:120px;height:50px;font-size:30px;">
                    <i class="fas fa-plus-square"></i>新增
                </button>
            </div>
        </div>
    </form>

    <script type="text/javascript">
        var x = new FileReader;
        document.forms[0].elements[0].onchange = function () {
            x.readAsDataURL(this.files[0]);
        }
        x.onloadend = function () {
            document.images[0].src = this.result;
        }

//         var inputElement = document.getElementById("form1");
// 　　     document.getElementById("btn").addEventListener("click",function () {
//                 inputElement.submit();
//         }); 


        //  $(function () {
        //     $("#btn").on("click", function (e) {
           
         






                // swal({
                //     title: '自动关闭弹窗！',
                //     text: '2秒后自动关闭。',
                //     timer: 2000
                // }).then(
                //     function () {},
                //     // handling the promise rejection
                //     function (dismiss) {
                //         if (dismiss === 'timer') {
                //             console.log('I was closed by the timer')
                //         }
                //     }
                // )
                            
        //                     Swal.fire({
        //         position: 'top-end',
        //         icon: 'success',
        //         title: 'Your work has been saved',
        //         showConfirmButton: false,
        //         timer: 1500
        //         })
        //      })
        //  })

   		 </script>
	

</body>

</html>