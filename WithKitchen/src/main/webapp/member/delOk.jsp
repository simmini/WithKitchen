<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원삭제 완료</title>
    	<% 
	
	session.invalidate();
	
	%>

</head>
<body>
<h1>회원 탈퇴 되었습니다. </h1>
	<a href="main.jsp">홈으로</a>
</body>
</html>