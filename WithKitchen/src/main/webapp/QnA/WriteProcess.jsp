<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="QnA.*" %>
<%@ page import="membership.*" %>
<%@ include file="../member/IsLoggedIn.jsp" %> 
<%
request.setCharacterEncoding("utf-8");
String text=request.getParameter("text");

%>
<% 
QnaDTO dto=new QnaDTO();

dto.setText(text);
dto.setId(session.getAttribute("UserId").toString());
%>

<%
QnaDAO dao = new QnaDAO();
int iResult=0;
iResult=dao.insertQnA(dto);
%>

<% 
if(iResult==1){
	response.sendRedirect("List.jsp"); 
}else{
	request.getRequestDispatcher("Write.jsp").forward(request, response);}
%>