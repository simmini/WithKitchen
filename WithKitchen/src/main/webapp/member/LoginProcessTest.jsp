<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="membership.*" %>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리 JSP</title>
</head>
<body>

<%
// 사용자가 입력한 아이디와 비밀번호 받아오기
	
	// 현재 페이지의 객체에다 담고 있다
	String userId = request.getParameter("user_id");
	String userPwd = request.getParameter("user_pwd");
	
	
	
	
	
	// 회원 테이블 DAO를 통해 회원정보 DTO 획득
	
	// 1. 서버 Connect
	MemberCheckDAO dao = new MemberCheckDAO();
/* 	MemberDAO dao = new MemberDAO(application); */
	
	// 2. 서버에 해당 유저가 있는지 확인
	MemberCheckDTO member = dao.getMemberDTO(userId, userPwd);
	
	// 3. 다쓰고 나서 다른유저도 사용해야하기 때문에 꼭 서버를 닫아준다
	dao.close();
	
	//로그인 성공 여부에 따른 처리
	// member은 해당유저가 DB에 있는경우 생기기 때문에
	// 다음과 같은 if 문으로 로그인의 기능을 구현가능하
	
	if(member.getId()!= null) {
		// 로그인성공시
		session.setAttribute("UserId", member.getId());
		session.setAttribute("UserName", member.getName());
		
		// 리다이렉트 해주기
		response.sendRedirect("LoginForm.jsp");
		
	} else {
		//로그인 실패시
		request.setAttribute("LoginErrMsg", "로그인 오류");
		request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
	}
%>


</body>
</html>