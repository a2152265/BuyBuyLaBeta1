<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
<title>新增商品</title>
  <style>
    body {
      font-family: "微軟正黑體";
      background-color: rgb(203, 218, 218);
      align-items: center;
      justify-content: center;
      position: relative;
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

    header {
      text-align: center;
    }

    input,
    textarea,
    select {
      border: 1px solid rgb(155, 153, 153, 0.4);
      background-color: rgb(203, 218, 218, 0.2);
    }

    form {
      background-color: rgb(255, 255, 255, 0.8);
      margin: 20px auto;
      max-width: 600px;
      padding: 80px;
      /* border-radius: 20px; */
      box-shadow: 0 10px 10px 0 rgba(177, 175, 175, 0.2);
    }

    .form-group__file {
      display: flex;
      flex-direction: column;
      position: relative;
      width: 100%;
      min-width: 130px;
      height: 180px;
    }

    .file-label {
      margin: 10px 0;
    }

    .file-input {
      opacity: 0;
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      width: 130px;
      height: 180px;
      cursor: pointer;
      z-index: 100;
    }

    .file-preview-background {
      position: absolute;
      bottom: 0;
      left: 0;
      width: 130px;
      height: 140px;
      background-color: #f7f7f7;
      border: 2px dashed #dfdfdf;
      border-radius: 10px;
      text-transform: uppercase;
      font-size: 14px;
      letter-spacing: 3px;
      text-align: center;
      color: #bbb;
      display: flex;
      justify-content: center;
      align-items: center;
      /* z-index: 1; */
    }

    .file-preview {
      width: 120px;
      height: 120px;
      position: absolute;
      top: 46px;
      left: 8px;
      border-radius: 65px;
      z-index: 10;
      object-fit: cover;
      opacity: 0;
      transition: opacity 0.4s ease-in;
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
<%-- 
 <form action="./ProductServlet" method="post" enctype="multipart/form-data">
  <fieldset>
   <legend>新增商品</legend>
   <label for="proName">商品名稱:</label><br> 
   <input type="text" name="proName" id="proName" ><br> 
   <label for="proPrice">商品價錢:</label><br> 
   <input type="text"name="proPrice" id="proPrice"><br> 
   <label for="proCnt">商品數量:</label><br>
   <input type="text" name="proCnt" id="proCnt"><br> 
   <label>產品類別:</label><br>
   <label> <input  type="radio" name="Categories" id="Categories1 "value="防疫商品">防疫商品</label> 
   <label> <input  type="radio" name="Categories" id="Categories2 "value="生活用品">生活用品</label>
   <label> <input  type="radio" name="Categories" id="Categories3 "value="手機周邊">手機周邊</label>
   <label> <input  type="radio" name="Categories" id="Categories4 "value="異國商品">異國商品</label>
   <label> <input  type="radio" name="Categories" id="Categories5 "value="男女衣著">男女衣著</label>
   
   <br>
   <label>商品資訊:</label>
   <br>
   <textarea name="proInfo" id="proInfo" rows="5" cols="22" style="margin: 20px;"></textarea>
   <br>
     <input type="submit" name="submit" value="送出">
  <input type="reset" value="重新填寫">
  </fieldset>

 
 </form>
--%>  


    <h1>新增商品</h1>

  <form action="./ProductServlet" method="post" >
    <table rules="all">
      <tbody>
        <tr>
          <td>商品代碼</td>
          <td><input type="text" name="proId" id="proId"><br><span id="idsp"></span></td>
        </tr>  
        <tr>
          <td>商品名稱</td>
          <td><input type="text" name="proName" id="proName"></td>
        </tr>
        <tr>
          <td>商品數量</td>
          <td><input type="text" name="proCnt" id="proCnt"><br><span id="idsp2"></span></td>
        </tr>
        <tr>
          <td>商品價格</td>
          <td><input type="text" name="proPrice" id="proPrice"></td>
        </tr>
        <tr>
        <td>商品分類</td>
        <td>
        <label> 
         <input  class="radio" type="radio" name="Categories" id="Categories1 "value="防疫商品">防疫商品</label> 
   <label> <input  type="radio" name="Categories" id="Categories2 "value="生活用品">生活用品</label>
   <label> <input  type="radio" name="Categories" id="Categories3 "value="手機周邊">手機周邊</label>
   <label> <input  type="radio" name="Categories" id="Categories4 "value="異國商品">異國商品</label>
   <label> <input  type="radio" name="Categories" id="Categories5 "value="男女衣著">男女衣著</label>
        </td>
  </tr>
        <tr>
          <td>商品描述</td>
          <td><textarea name="proInfo" id="proInfo" cols="30" rows="10"></textarea></td>
        </tr>
 
     <tr>
          <td>商品照片</td>
          <td><input type="text" name="proImg" id="proImg"></td>
        </tr>
      </tbody>
    </table>
    
   <br>
<%--
    <div class="form-group__file">
      <label for="imageUpload" class="file-label"></label>
      <div class="file-wrapper">
        <input type="file" name="image" id="image" class="file-input" />
        <div class="file-preview-background">添加商品照片
        </div>
      </div>
        <img src="" id="imagePreview" width="200px" class="file-preview" />
      </div>--%>
   <div class="wrap">
   <button type="submit" name="submit" class="button">確認</button>
 </div>
    </form>
      


  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script>

  <%--
    $('#image').change(function () {
      readImgUrlAndPreview(this);
    });

    function readImgUrlAndPreview(input) {
      if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
          $('#imagePreview').attr('src', e.target.result);
          $('#imagePreview').css('opacity', 1);
        }
      };
      reader.readAsDataURL(input.files[0]);
    } --%>


    document.getElementById("proId").addEventListener("blur", checkName);
    document.getElementById("proCnt").addEventListener("blur", checkAnt);
    
    function checkName() {
        let theIdObj = document.getElementById("proId");
        let theIdObjVal = theIdObj.value;

        let sp = document.getElementById("idsp");
        let theIdObjValLen = theIdObjVal.length;
        let flag1 = false;

        if (theIdObjVal == "") {
            sp.innerHTML = "請輸入代碼";
        }
        else if (theIdObjValLen >= 1) {
            for (i = 0; i < theIdObjValLen; i++) {
                let ch = theIdObjVal.charAt(i);
                if (ch >= 0 && ch <= 9) {
                    flag1 = true;
                }
                else {
                    flag1 = false;
                    break;
                }
            }
            if (flag1) {
                sp.innerHTML = "";
            }
            else {
                sp.innerHTML = "代碼必須全部為數字";
            }
        }
    
    }
    
    function checkAnt() {
        let theIdObj = document.getElementById("proCnt");
        let theIdObjVal = theIdObj.value;

        let sp = document.getElementById("idsp2");
        let theIdObjValLen = theIdObjVal.length;
        let flag1 = false;

        if (theIdObjVal == "") {
            sp.innerHTML = "請輸入數量";
        }
        else if (theIdObjValLen >= 1) {
            for (i = 0; i < theIdObjValLen; i++) {
                let ch = theIdObjVal.charAt(i);
                if (ch >= 0 && ch <= 9) {
                    flag1 = true;
                }
                else {
                    flag1 = false;
                    break;
                }
            }
            if (flag1) {
                sp.innerHTML = "";
            }
            else {
                sp.innerHTML = "數量必須全部為數字";
            }
        }
    
    }
  </script>
  
  
 

</body>

</html>