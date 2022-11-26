<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="utils.*" %>
<%@ page import="res.*" %>
    
    
<%

String setRes_no = (String) session.getAttribute("Res_no");

ResDAO dao = new ResDAO();

int dResult = dao.delReservation(setRes_no);
dao.close();

if(dResult == 1) {
	response.sendRedirect("ResCancelOk.jsp");
}else {
	request.getRequestDispatcher("ReservationCheck.jsp").forward(request,response);
}

%>


