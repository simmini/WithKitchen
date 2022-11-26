<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그아웃 페이지</title>
</head>
<body>
<%

	session.invalidate(); //모든 속성값 삭제
	response.sendRedirect("../member/main.jsp");
	
%>

</body>
</html>