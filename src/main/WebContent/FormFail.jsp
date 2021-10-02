<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>使用者註冊</title>
<style>
.formElem {
	border-bottom: 1px solid purple;
	border-left: 0px;
	border-right: 0px;
	border-top: 0px;
	margin-top: 56px;
}

form {
	text-align: center;
}

.checktextspan {
	font-size: 5px;
}

.loginarea {
	text-align: center;
}
</style>


</head>


<body>
	<div class="resgisterform">
		<form action=".\RegisterServlet" method="post">
			<tr>
				<td></td>
				<input class="formElem" type="text" name="phone" id="phone"
					size="30" placeholder="phone">
				</td>
				<br>
				<span id="idPhone" style="color: red;"></span>
				<br>
				<!-- <span id="idsp3">(1.至少6位數 2.含英文+數字+特殊字元 3.不能空白)</span>
                <span id="idsp4" style="color: sienna;"></span> -->

			</tr>
			<tr>
				<td></td>
				<input class="formElem" type="text" name="idEmail" id="idEmail"
					size="30" placeholder="E-mail">
				<br>
				<span id="idEmail1" style="color: red;"></span>
				<br>

				</td>
				<br>
			</tr>
			<tr>
				<td></td>
				<input class="formElem" type="Password" name="Password" id="idPwd"
					size="30" placeholder="Password">
				<br>
				<span id="idsp" style="color: black;"></span>
				<span id="idsp0" style="color: red;"></span>
				<span id="idsp1"></span>
				<br />
				<span class="hint">(1.不可空白 2.至少6個字且必須包含英數字)</span>
				</td>
				<br>


				<br>

			</tr>
			<tr>

				<br>
				<td><input type="submit" id="submit" style="display:none;"  name="submit" value="註冊" class="reg">
				</td>
			</tr>

		</form>
		<div class="loginarea">
			<hr>
			<h3>已有帳號?</h3>
			<a href="UserLogin.jsp">
				<p class="text">登入以繼續</p>
			</a>
		</div>

		</form>
	</div>
	
	<script src=""></script>
    <script>
    window.alert('帳號重複拉');
        document.getElementById("idEmail").addEventListener('blur', checkEmail);
        document.getElementById("idPwd").addEventListener('blur', checkPwd);
        document.getElementById("phone").addEventListener('blur', checkPhone);
        
        
        let checkPhoneTrue = false, checkEmailTrue = false, checkPwdTrue = false;
        let submitBtn = document.getElementById('submit');
     

        //驗證手機
        function checkPhone() {
            let phonee = document.getElementById('phone').value;
            let regg=new RegExp("^09\\d{8}$");
            let idPhoneSp = document.getElementById("idPhone");
            if (phonee == "") {
                idPhoneSp.innerHTML = "此欄位不可空白";
                checkPhoneTrue = false;
                //錯誤格式就隱藏BTN
                submitBtn.style.display = "none";

            }else{
                if (!regg.test(phonee)) {
                    idPhoneSp.innerHTML = "手機格式錯誤";
                    console.log("錯誤");
                    checkPhoneTrue = false;
                    //錯誤格式就隱藏BTN
                    submitBtn.style.display = "none";
                    return false;
                    
                } else {
                    idPhoneSp.innerHTML = "有效的手機號碼";
                    console.log("正確");
                    checkPhoneTrue = true;

                    //三個輸入ㄉ正確才打開隱藏
                    if (checkPhoneTrue == true && checkEmailTrue == true && checkPwdTrue == true) {
                        //打開隱藏
                        console.log("打開拉");
                        submitBtn.style.display = "block";
                        submitBtn.style.marginLeft="450px";
                    } else {
                        //隱藏
                        submitBtn.style.display = "none";
                    }
                    return true;
                }

            }

        }

        //驗證emaill;;
        function checkEmail() {
            console.log("YAA");
            let reg = new RegExp("^[a-z0-9]+([._\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$");//正則表達式
            let emailobj = document.getElementById("idEmail");//要驗證的對象
            let emailobjVal = emailobj.value;  //
            let mailsp1 = document.getElementById("idEmail1");

            if (emailobjVal == "") {     //輸入不能為空          
                mailsp1.innerHTML = "此欄位不可空白";
                checkEmailTrue = false;
                //錯誤格式就隱藏BTN
                submitBtn.style.display = "none";
                return false;
            } else if (!reg.test(emailobjVal)) {//正則驗證不通過，格式不對          
                mailsp1.innerHTML = "格式錯誤!";
                checkEmailTrue = false;
                //錯誤格式就隱藏BTN
                submitBtn.style.display = "none";
                return false;
            } else {
                mailsp1.innerHTML = "有效的電子郵件";
                checkEmailTrue = true;
                //三個輸入ㄉ正確才打開隱藏
               if (checkPhoneTrue == true && checkEmailTrue == true && checkPwdTrue == true) {
                       //打開隱藏
                       console.log("打開拉");
                       submitBtn.style.display = "block";
                       submitBtn.style.marginLeft="450px";
                   } else {
                       //隱藏
                       submitBtn.style.display = "none";
                   }
                return true;
            }
        }
        //驗證密碼
        function checkPwd() {
            let thePwdObj = document.getElementById("idPwd");
            let thePwdObjVal = thePwdObj.value;
            let sp = document.getElementById("idsp");
            let sp1 = document.getElementById("idsp0");
            let sp2 = document.getElementById("idsp1");
            let thePwdObjValLen = thePwdObjVal.length;
            let ch, flag1 = false, flag2 = false, flag3 = false;
            if (thePwdObjVal == "" || thePwdObjValLen < 6) {
                sp1.innerHTML = "密碼至少6位";
                console.log("<6");
                checkPwdTrue = false;
                //錯誤格式就隱藏BTN
                submitBtn.style.display = "none";
            } else if (thePwdObjValLen >= 6) {

                for (let i = 0; i < thePwdObjVal.length; i++) {
                    ch = thePwdObjVal.charAt(i).toUpperCase();
                    // console.log(ch);
                    if (ch >= 'A' && ch <= 'Z')
                        flag1 = true;
                    else if (ch >= '0' && ch <= '9')
                        flag2 = true;
                    // else if (ch == "@" || ch == "!" || ch == "#" || ch == "%" || ch == "^" || ch == "&" || ch == "*")
                    //     flag3 = true;
                    if (flag1 && flag2)
                        break;

                }

                if (flag1 && flag2) {
                    sp1.innerHTML = "有效密碼";
                    sp.innerHTML = "";
                    console.log(thePwdObjVal);
                    checkPwdTrue = true;
                    //三個輸入ㄉ正確才打開隱藏
                    if (checkPhoneTrue == true && checkEmailTrue == true && checkPwdTrue == true) {
                        //打開隱藏
                        console.log("打開拉");
                        submitBtn.style.display = "block";
                        submitBtn.style.marginLeft="450px";
                    } else {
                        //隱藏
                        submitBtn.style.display = "none";
                    }
                    if (thePwdObjVal.length <= 8) {
                        sp1.innerHTML = "有效密碼  強度:";
                        sp2.innerHTML = "低";
                        sp2.style.color = 'gray';
                    }

                    else if (thePwdObjVal.length <= 10) {
                        sp1.innerHTML = "有效密碼 強度:";
                        sp2.innerHTML = "中";
                        sp2.style.color = 'pink';
                    }

                    else if (thePwdObjVal.length >= 12) {
                        sp1.innerHTML = "有效密碼 強度:";
                        sp2.innerHTML = "強";
                        sp2.style.color = 'purple';

                    }
                } else {
                    sp1.innerHTML = " <img src='./image/error.png'>密碼格式錯誤";
                    sp.innerHTML = "";
                    sp2.innerHTML = "";
                    console.log(thePwdObjVal);
                    checkPwdTrue = false;
                    //錯誤格式就隱藏BTN
                    submitBtn.style.display = "none";
                }

            }

        }

        // function checkDate() {
        //     let theDateObj = document.getElementById("date");
        //     console.log(typeof theDateObj)
        //     let theDateObjVal = theDateObj.value;
        //     let sp = document.getElementById("idsp3");
        //     let sp2 = document.getElementById("idsp4");
        //     console.log(typeof theDateObjVal);
        //     console.log(theDateObjVal);
        //     let d = new Date(theDateObjVal);
        //     console.log(d);
        //     var year = d.getFullYear();
        //     var month = d.getMonth() + 1;
        //     var day = d.getDate();
        //     console.log(typeof month, day);
        //     var month2 = theDateObjVal.substr(5, 2);
        //     console.log(month2);
        //     if (month == month2) {
        //         sp.innerHTML = "正確日期";
        //         sp2.innerHTML = "";
        //     } else {
        //         sp.innerHTML = "";
        //         sp2.innerHTML = " <img src='../Lab07/Images/error.png'>無效日期";

        //     }

        // }

    </script>
	

</body>
</html>