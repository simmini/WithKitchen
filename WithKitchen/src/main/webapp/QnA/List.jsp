<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="QnA.*" %>
<%@ page import="utils.QnAPage" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="utils.JSFunction" %>
<%@ include file="../member/IsLoggedIn.jsp" %>

<%

QnaDAO dao = new QnaDAO();


Map<String,Object> paging= new HashMap<String,Object>();


int totalCount = dao.selectCount(paging); //게시물 수 확인


//전체 페이지 수 계산
int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
int totalPage = (int)Math.ceil((double)totalCount / pageSize); // 전체 페이지 수

//현재 페이지 확인
int pageNum = 1;  // 기본값
String pageTemp = request.getParameter("pageNum");
if (pageTemp != null && !pageTemp.equals(""))
 pageNum = Integer.parseInt(pageTemp); // 요청받은 페이지로 수정

//목록에 출력할 게시물 범위 계산
int start = (pageNum - 1) * pageSize + 1;  // 첫 게시물 번호
int end = pageNum * pageSize; // 마지막 게시물 번호
paging.put("start", start);
paging.put("end", end);
/*** 페이지 처리 end ***/
List<QnaDTO> QnaLists = dao.paging(paging);
dao.close();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문하기</title>
<script>
function deleteQnA() {
    var confirmed = confirm("정말로 삭제하겠습니까?"); 
    if (confirmed) {
        var form = document.deleteFrm;        
        form.method = "post";               // 전송 방식 
        form.action = "DeleteProcess.jsp";  // 전송 경로
        form.submit();                      // 폼값 전송
    }
}
</script>
</head>
<body>

<h2>목록 보기(List) - 현재 페이지 : <%= pageNum %>(전체 : <%= totalPage %>)
(전체 게시물 수 : <%= totalCount %>)</h2>
<%
if (QnaLists.isEmpty()) {
    // 게시물이 하나도 없을 때
%>
	<table>
        <tr>
            <td colspan="5" align="center">
                등록된 문의글이 없어요..i_i
            </td>
        </tr>
	</table>
<%
}
else {
    // 게시물이 있을 때
    int virtualNum = 0;  // 화면상에서의 게시물 번호
    int countNum = 0;
    for (QnaDTO dto : QnaLists)
    {
        // virtualNumber = totalCount--;  // 전체 게시물 수에서 시작해 1씩 감소
        virtualNum = totalCount - (((pageNum - 1) * pageSize) + countNum++);
%>
<form name="deleteFrm">
	<table style="width:90%; padding:20px;">
	<tr align="center">
		<td align="left">
			<%=dto.getId() %>
		</td>
		<td align="right">
			<%=dto.getPostdate() %>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<%=dto.getText() %>
		</td>
	</tr>
	<tr>
		<td>
		    <button type="button"
                        onclick="location.href='Edit.jsp?num=<%= dto.getNum()%>';" style="float:left;">
                    수정하기</button>
                    
                <button type="button" onclick="deleteQnA();"style="float:left;">삭제하기</button> </td><td>
                <input type="hidden" name="num" value="<%= dto.getNum()%>">
		</td>
		
	</tr>

	
<%
    }
}
%>
    </table>
</form>
    <!--목록 하단의 [글쓰기] 버튼-->
    <table width="90%">
        <tr align="center">
            <!--페이징 처리-->
            <td>
                <%= QnAPage.pagingStr(totalCount, pageSize,
                       blockPage, pageNum, request.getRequestURI()) %>  
            </td>
            <!--글쓰기 버튼-->
            <td><button type="button" onclick="location.href='Write.jsp';">글쓰기
                </button></td>
        </tr>
    </table>
</body>
</html>