<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="Post.PostDAO" %>
    <%@ page import="Post.PostDTO" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공간 게시판 상세보기</title>

<%

	//작성한 게시글의 해당 번호 받기, List.jsp에서 넘겨준 num받기
	String kit_num=request.getParameter("kit_num");
	//out.print(kit_num);
	PostDAO dao=new PostDAO();
	PostDTO dto=new PostDTO();
	dto=dao.selectView(kit_num);//게시물번호를 가지고 게시물 가져오기 기능
	
	dao.close();

%>

<script>
function deletePost()
{	
	var confirmed=confirm("정말로 삭제하겠습니까?");
	if(confirmed)
		{
			var form=document.writeFrm;
			form.method="post";
			form.action="Post_deleteProcess.jsp";
			form.submit();
		}
}

	</script>

<style>
  .container {
    width: 960px;
    margin : 0 auto;
  }
  .navi{
    
    width:1080px;
    height:50px;
    padding-bottom:10px;
    border-bottom:2px solid #ccc;
  }

  .navi ul{
    
    list-style: none;
    padding-top:10px; 
    padding-bottom:5px;
  }
  .navi ul li {
    display:block;
    width:120px;
    padding:auto;  
    margin:10px auto;
    float: left;
  }
  .navi a:link, .navi a:visited {
    color:#222;
    font-size:14px;
    padding: 30px; 
    text-decoration: none;  /* 밑줄 없음 */

  }
  .navi a:hover,  .navi a:focus,.navi a:active {
    background-color:yellowgreen;  /* 배경색 */
    color:#fff;  /* 글자색 */
  }

  
  .contents {
    /* text-align:left; */
    margin:20px auto;
    width:400px;
    padding:40px;
    border:1px solid #222;
    float: left;
    border-radius:5px;
            
  }
  
  #intro:target {
    background-color:lightslategray; 
  }
  #information:target {
    background-color:lightslategray; 
  }
  #precautions:target{
    background-color:lightslategray; 
  }
  #refund:target{
    background-color:lightslategray; 
  }
  #QnA:target{
    background-color:lightslategray; 
  }
  #review:target{
    background-color:lightslategray; 
  }

</style>
</head>



<body>
<form name="writeFrm">
    <input type="hidden" name="num" value="<%=kit_num %>" /> 
<div class="container">
    <nav class="navi">
      <ul>
        <li><a href="#intro">공간소개</a></li>
        <li><a href="#information">시설안내</a></li>
        <li><a href="#precautions">유의사항</a></li>
        <li><a href="#refund">환불정책</a></li>
        <li><a href="#QnA">Q & A</a></li>
        <li><a href="#review">이용후기</a></li>
      </ul>
    </nav>  
    
    <div id="intro" class="contents">
      <h2>공간소개</h2>
      
      <p><%=dto.getKit_info() %></p>
    </div>


    <div id="information" class="contents">
      <h2>시설안내</h2>
      <p> <%=dto.getKit_intro() %></p>
  
    </div>
    
    <div id="precautions" class="contents">
      <h2>유의사항</h2>
      <p><%=dto.getKit_notice() %> </p>
    </div>


    <div id="refund" class="contents">
        <h2>환불정책</h2>
        <p> </p>
      </div>

    <div id="QnA" class="contents">
        <h2>Q&A</h2>
        <p> </p>
    </div>

    <div id="review" class="contents">
        <h2>이용후기</h2>
        <p> </p>
         </div>
    	<%
    	//로그인 id와 현재 세션에 글을 쓴 사람의 
      		if(session.getAttribute("UserId")!=null&&session.getAttribute("UserId").toString().equals(dto.getKit_id()))//로그인이 되었을경우에만 수정,삭제버튼보이게
           	{
      	%>
      		<div align="center">
      		<button type="button" onclick="location href='Post_update.jsp?num=<%=dto.getKit_num()%>';">수정하기</button>
      		<button type="button" onclick="deletePost();">삭제하기</button>  
      		</div>
          <% }%>
            		
  </div>
  <div align="center">
<button type="button" onclick="location.href='Post_list.jsp';">리스트 보기</button>

</div>

</form>
</body>
</html>