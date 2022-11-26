<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="membership.*" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>idCheckProc.jsp</title>
</head>
<body>
	<div style="text-align: center"></div>
	<h3>* 아이디 중복 확인 결과 *</h3>
<%

	MemberCheckDAO dao = new MemberCheckDAO();

    //1) 사용가능한 아이디일 경우, 아이디 입력 폼에 넣기 위함
    String id=request.getParameter("id");
    int cnt=dao.duplecateID(id);
    /* out.println("입력 ID : <strong>" + id + "</strong>"); */
    if(cnt==0){
    	out.println("<p>사용 가능한 아이디입니다.</p>");
    	%>
    	
    	<input type="text" id="cInput" value="<%= id %>" readonly/>
    	
    	
    	<%
    	
	out.println(" <input type='button' value='사용하기' onclick='getParentText()' /> ");
%>
    
	<script>
         function getParentText() {

             opener.document.getElementById("pInput").value =
               document.getElementById("cInput").value;
             
             window.close();
           }
    </script>
 <%
 	}else{
    	out.println("<p style='color: red'>해당 아이디는 사용하실 수 없습니다.</p>");
    }//if end
 %>
 <hr>
 <a href="javascript:history.back()">[다시시도]</a>
 &nbsp; &nbsp;
 <a href="javascript:window.close()">[창닫기]</a>
 
 </body>
 </html>
