<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head><title>Session</title></head>
<body>
	<a href="main.jsp">Home</a>
    <h2>로그인 페이지</h2>
    <span style="color: red; font-size: 1.2em;"> 
        <%= request.getAttribute("LoginErrMsg") == null ?
                "" : request.getAttribute("LoginErrMsg") %>
    </span>
    <%
    if (session.getAttribute("UserId") == null) {  // 로그인 상태 확인
        // 로그아웃 상태
    %>
    <script>
    function validateForm(form) {
        if (!form.user_id.value) {
            alert("아이디를 입력하세요.");
            return false;
        }
        if (form.user_pw.value == "") {
            alert("패스워드를 입력하세요.");
            return false;
        }
    }
    </script>
    <form action="LoginProcessTest.jsp" method="post" name="loginFrm"
        onsubmit="return validateForm(this);">	<!--서브밋 하기전에 먼저 validateForm 에서 검사받아야 서브밋 가 -->
        아이디 : <input type="text" name="user_id" /><br />
        패스워드 : <input type="password" name="user_pwd" /><br />
        <input type="submit" value="로그인하기"  />
    </form>
    <%
    } else { // 로그인된 상태
    %>
        <%= session.getAttribute("UserName") %> 회원님, 로그인하셨습니다.<br />
    <%
    }
    %>
</body>
</html>