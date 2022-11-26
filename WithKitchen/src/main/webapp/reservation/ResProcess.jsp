<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="res.*"%>
<%@ page import= "java.sql.Date" %>
<%@ page import= "java.text.SimpleDateFormat" %>



<!-- 폼값 받기 -->

<%
	request.setCharacterEncoding("UTF-8");


	String res_no = request.getParameter("res_no");
	String res_purpose = request.getParameter("res_purpose");
	String res_request = request.getParameter("res_request");
	String res_people = request.getParameter("res_people");
	String res_date = request.getParameter("res_date");
			
	out.print(res_no);
%>

<!-- boradDTO객체에 저장 -->
<%

ResDTO dto = new ResDTO();

dto.setRes_no(res_no);
dto.setRes_purpose(res_purpose);
dto.setRes_request(res_request);
dto.setRes_people(res_people);
dto.setRes_date(res_date);
%>

<!-- dao객체를 통해 DB에 DTO저장  -->
<%
ResDAO dao = new ResDAO();
int Result = dao.insertReservation(dto);
dao.close();

%>

<!-- 글 DB입력 성공과 실패 여부 처리 -->
<%
if(Result == 1){
	response.sendRedirect("ResSuccess.jsp");
}else{
	request.getRequestDispatcher("이전페이지.jsp").forward(request, response);
}

%>



