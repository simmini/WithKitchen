<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인전 마이페이지</title>  
    
</head>


<body>
<form>
  <a href ="../member/main.jsp">Home</a>
    <div class="loginbox">
       <label class="login">
         <a href=" ../member/LoginForm.jsp">
            <input type="button" value="LOGIN" style="width: 300px; height: 50px; font-size: 30px; border: none;">
        </a>
       </label>
    </div>
    <br>
    <br>
    <div class="anotherbox">
        <label class="">
            <a href="../member/memberJoin.jsp">
                <input type="button" value="회원가입" style="width: 150px; height:30px; border: none">
            </a>
        </label>
        <label class="find">
            <a href=" 아이디 비밀번호 찾기">
                <input type="button" value="아이디/비밀번호 찾기" style="width: 150px; height:30px;border: none">
            </a>
        </label>
    </div>
    <br>
    <br>
    <div class="anotherbox">
        <label class="gonggibutton">
            <a href="../Goggi/GoggiMain.jsp">
                <input type="button" value="공지사항"style="width: 150px; height:30px;border: none">
            </a>
        </label>
        <label class="onebyone">
            <a href="https://open.kakao.com/o/swQgVaAe">
                <input type="button" value="1:1 문의"style="width: 150px; height:30px;border: none">
            </a>
        </label>
    </div>
    
    </form>
</body>
</html>