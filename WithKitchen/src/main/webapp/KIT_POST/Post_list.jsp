<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@ page import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Post.PostDTO" %>
<%@ page import="Post.PostDAO" %>

<% 
//상세보기 전페이지 


	// DAO를 생성해 DB에 연결
	PostDAO dao=new PostDAO();//커넥션 요청 (객체를 전달 List->boardDAO->JDBConnect) 
	
	// 사용자가 입력한 검색 조건을 Map에 저장
	Map<String,Object> param=new HashMap<String,Object>();
	//검색기능
	String searchField= request.getParameter("searchField");
	String searchWord=request.getParameter("searchWord");//값을 꺼내와서 값들을 저장
 	if(searchWord!=null)//출력
 	{
 		param.put("searchField",searchField);
 		param.put("searchWord",searchWord);
 	}	
 	
	// 게시물 수 확인
	int totalCount=dao.selectCount(param);
	
 	// 게시물 목록 받기
	List<PostDTO> postLists=dao.selectList(param);
	
 	// DB 연결 닫기
 	dao.close();//닫아줘야 다음 사람도 사용가능

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>
<body>
 

    <h2>목록 보기(List)</h2>
    <!-- 검색폼 --> 
    <form method="get">  
  
    <table border="1" width="90%">
    <tr>
        <td align="center">
            <select name="searchField"> 
                <option value="title">제목</option> 
                <option value="content">내용</option>
            </select>
            <input type="text" name="searchWord" />
            <input type="submit" value="검색하기" />
        </td>
    </tr>   
 	</table>
    
    </form>
    
    <!-- 게시물 목록 테이블(표) --> 
    <table border="1" width="90%">
        <!-- 각 칼럼의 이름 --> 
        <tr>
            <th width="10%">번호</th>
            <th width="50%">공간명</th>
            <th width="15%">작성자</th>          
            <th width="15%">전화번호</th>
        </tr>
        <!-- 목록의 내용 --> 
	<%
		if(postLists.isEmpty())
		{
	%>
        <tr>
            <td colspan="5" align="center">
                등록된 게시물이 없습니다^^*
            </td>
        </tr>
		<%
		}else{
		//게시물이 있을때
		int virtualNum=0;//화면상의 게시물 번호
		for(PostDTO dto: postLists )
		{
			virtualNum=totalCount--;//전체 게시물수에서 시작해 1씩 감소시키면서 뿌린다.
		%>


        <tr align="center">
            <td><%=virtualNum %></td>  <!--게시물 번호-->
            <td align="left">  <!--제목(+ 하이퍼링크)-->
                <a href="Post_form.jsp?kit_num=<%=dto.getKit_num()%>"> <%=dto.getKit_name() %></a> 
            </td>
            <td align="center"><%=dto.getKit_id()%></td>          <!--작성자 아이디-->
            
            <td align="center"><%=dto.getKit_tel() %></td>    <!--작성일-->
        </tr>
	<% 
		}//for문 끝
	}//else끝
	%>


    </table>
    <!--목록 하단의 [글쓰기] 버튼-->
    <table border="1" width="90%">
        <tr align="right">
            <td>
            	<button type="button" onclick="location.href='Post_write.jsp';">글쓰기</button>
            	<button type="button" onclick="location.href='../QnA/list.jsp';">질문하기</button>
            </td>
        </tr>
    </table>
</body>
</html>
