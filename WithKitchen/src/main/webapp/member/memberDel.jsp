<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%@ include file="IsLoggedIn.jsp"%>
	<%@ page import="utils.*" %>
	
	<%@ page import="membership.*" %>
	
	 <%
	 
	 //현재 페이지에 디비에서 회원 정보 받아오기 
	 
	 	String setId= (String)session.getAttribute("UserId");		
	     
   		MemberCheckDAO dao = new MemberCheckDAO();
    	
    	MemberCheckDTO member = dao.getMemUdt(setId);
    	
    	dao.close();

	 %>
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2><%= setId %> 아이디를 정말 삭제 하시겠습니까?</h2>


<button type="button" value="예" onclick="location.href='/WithKitchen/member/memberDelProcess.jsp'">예</button>



<button type="button" value="아니요" onclick="location.href='/WithKitchen/member/main.jsp'" >아니요</button>

</body>
</html>