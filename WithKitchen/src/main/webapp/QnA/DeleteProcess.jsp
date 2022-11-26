<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="utils.JSFunction" %>
<%@ page import="QnA.*" %>

<%
String num=request.getParameter("num");

QnaDTO dto=new QnaDTO();
QnaDAO dao=new QnaDAO();

dto=dao.selectList();
String id=(String)session.getAttribute("UserId");

int result=0;
if(id.equals(dto.getId())){
	dto.setNum(num);
	result=dao.deleteQnA(dto);
	dao.close();
	
	if(result==1){
	JSFunction.alertLocation("삭제되었습니다.", "List.jsp", out);}
	else{
		JSFunction.alertBack("삭제에 실패하였습니다.", out);
	}
}else{
	JSFunction.alertBack("본인만 삭제 가능합니다.",out);
}
%>