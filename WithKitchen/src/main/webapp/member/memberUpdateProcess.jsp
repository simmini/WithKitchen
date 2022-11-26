<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="membership.*" %>
    
    <%@ page import="utils.*" %>
    
    <% 
    
    // member체크dao에 업데이트 메소드 추가하기
    
    
    String joinId = request.getParameter("joinId");
	String joinPwd = request.getParameter("joinPwd");
	String joinTel = request.getParameter("joinTel");
	String joinEmail = request.getParameter("joinEmail");
	String joinBus = request.getParameter("joinBus");

	
	
	MemberCheckDTO dto = new MemberCheckDTO();
	
	dto.setId(joinId);
	dto.setPwd(joinPwd);
	dto.setTel(joinTel);
	dto.setEmail(joinEmail);
	dto.setBus(joinBus);
	
	
	MemberCheckDAO dao = new MemberCheckDAO();
	
	int jresult = dao.udtMember(dto);
	
	
	if(jresult == 1) {
		response.sendRedirect("udtOk.jsp");
	} else {
		request.getRequestDispatcher("memberJoin.jsp").forward(request, response);
	}


    
    
       
    
    %>
    
    
    
    
    
    
    
    
    