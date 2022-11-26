<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="utils.JSFunction" %>
<%@ page import="QnA.*" %>
<%
	String num=request.getParameter("num");
	String text=request.getParameter("text");
	
	QnaDTO dto = new QnaDTO();
	dto.setNum(num);
	dto.setText(text);
	
	QnaDAO dao = new QnaDAO();
	int result=dao.updateEdit(num,text);
	if(result==1){
		response.sendRedirect("List.jsp");
	}
	else
	{
		JSFunction.alertBack("수정하기 실패", out);
	}
%>