<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="membership.*" %>
    
    <%@ page import="utils.*" %>
    
    <% 
    
    // member체크dao에 딜리트 메소드 추가하기
    
    String setId= (String)session.getAttribute("UserId");		
    
	     
   		MemberCheckDAO dao = new MemberCheckDAO();
    	
   		int jresult = dao.delMember(setId);
    	
    	dao.close();


	if(jresult == 1) {
		response.sendRedirect("delOk.jsp");
	} else {
		request.getRequestDispatcher("memberJoin.jsp").forward(request, response);
	}
    
       
    
    %>
