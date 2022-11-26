<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="QnA.*" %>
<%@ page import="utils.*" %>
<%@ include file="../member/IsLoggedIn.jsp" %>
<%
String num = request.getParameter("num");  // 일련번호 받기 
out.print(num);
QnaDAO dao = new QnaDAO();  // DAO 생성
QnaDTO dto = dao.selectView(num);        // 게시물 가져오기 
String sessionId = session.getAttribute("UserId").toString(); // 로그인 ID 얻기 
if (!sessionId.equals(dto.getId())) {      // 본인인지 확인
    JSFunction.alertBack("작성자 본인만 수정할 수 있습니다.", out);
    return;
}
dao.close();  // DB 연결 해제
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문하기</title>
<script>
function validateForm(form) {
	 if (form.text.value == "") {
		alert("내용을 입력하세요.");
		form.text.focus();
		return false;
	}
}
</script>
</head>
<body>
<h2>문의글 게시판 - 수정하기</h2>
<form name="writeFrm" method="post" action="EditProcess.jsp"
      onsubmit="return validateForm(this);">
    <input type="hidden" name="num" value="<%= dto.getNum() %>" />
     <table border="1" width="90%">
        <tr>
            <td>내용</td>
            <td>
                <textarea name="text" style="width: 90%; height: 100px;"><%= dto.getText() %></textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="submit">작성 완료</button>
                <button type="reset">다시 입력</button>
                <button type="button" onclick="location.href='List.jsp';">
                    목록 보기</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
</body>
</html>