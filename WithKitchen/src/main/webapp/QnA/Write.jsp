<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문하기</title>
<script type="text/javascript">
function validateForm(form){
	if(form.text.value==""){
		alert("내용을 입력하세요.");
		form.text.focus();
		return false;
	}
}
</script>
</head>
<body>
<h2>문의글 게시판 - 작성하기</h2>
<form name="writeFrm" method="post" action="WriteProcess.jsp"
 	onsubmit="return validateForm(this);">
 	<table border="1" width="90%">
 		<tr>
 			<td>내용</td>
 			<td>
 				<textarea name="text" style="width:90%; height:100px;"></textarea>
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