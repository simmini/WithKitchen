<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%@ page import="MemberJoin.*"  %>
    
<%

	// join form 받아오기
	
	String joinId = request.getParameter("joinId");
	String joinPwd = request.getParameter("joinPwd");
	String joinName = request.getParameter("joinName");
	String joinTel = request.getParameter("joinTel");
	String joinEmail = request.getParameter("joinEmail");
	String joinBus = request.getParameter("joinBus");
	
	
	
	// DTO에저장
	
	MemberJoinDTO dto = new MemberJoinDTO();
	
	dto.setId(joinId);
	dto.setPwd(joinPwd);
	dto.setName(joinName);
	dto.setTel(joinTel);
	dto.setEmail(joinEmail);
	dto.setBus(joinBus);
	
	
	// DAO 로 DB에 데이터 저장
	
	MemberJoinDAO dao = new MemberJoinDAO();
	int jresult = dao.insertMember(dto);
	
	
	if(jresult == 1) {
		response.sendRedirect("joinOk.jsp");
	} else {
		request.getRequestDispatcher("memberJoin.jsp").forward(request, response);
	}





%>
    
