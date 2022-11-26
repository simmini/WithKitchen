
<!-- 

1. 현재 페이지가 로그인되어 있는 세션인지 체크하기 ok

2. 세션 아이디를 통해 디비에서 해당 아이디의 정보 셀렉트 해오기
멤버 업데이트 프로세스에서 디비연결후 값 저장하기 ok

3. 셀렉트한 데이터를 해당 칸에 뿌려주기 ok

4. 수정 완료 버튼을 누르면 업데이트 해주기

5. 회원 탈퇴를 누르면 비밀 번호를 입력해서 한번더 확인하기

6. delete회원 하고 초기화된 메인페이지로 나가기


 -->



				

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="IsLoggedIn.jsp"%>
	<%@ page import="utils.*" %>
	
	<%@ page import="membership.*" %>
	
	 <%
	 
	 //현재 페이지에 디비에서 회원 정보 받아오기 
	 
	 	String setId= (String)session.getAttribute("UserId");		
	     
   		MemberCheckDAO dao = new MemberCheckDAO();
    	
    	MemberCheckDTO member = dao.getMemUdt(setId);
    	
    	dao.close();

    	
	 
	 %>
	
	
	
	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 수정</title>



<script type="text/javascript">

// 비밀번호 체크하기 


function check_pw(){
	 
    var pw = document.getElementById('pw').value;
    var SC = ["!","@","#","$","%"];
    var check_SC = 0;

    if(pw.length < 6 || pw.length>16){
        window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
        document.getElementById('pw').value='';
    }
    for(var i=0;i<SC.length;i++){
        if(pw.indexOf(SC[i]) != -1){
            check_SC = 1;
        }
    }
    if(check_SC == 0){
        window.alert('!,@,#,$,% 의 특수문자가 들어가 있지 않습니다.')
        document.getElementById('pw').value='';
    }
    if(document.getElementById('pw').value !='' && document.getElementById('pw2').value!=''){
        if(document.getElementById('pw').value==document.getElementById('pw2').value){
            document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
            document.getElementById('check').style.color='blue';
        }
        else{
            document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
            document.getElementById('check').style.color='red';
        }
    }
}

</script>


</head>
<body>
	<div>
		<form action="memberUpdateProcess.jsp" method="post" name="udtFrm">

			<fieldset>

				<h2>아이디</h2>
				
				<input type="text" name="joinId" id="pInput" size="15"  value="<%= member.getId() %>" readonly>

				<br />
				
				<h2>변경할 비밀번호</h2>
				<input type="password" name="joinPwd" id="pw" onchange="check_pw()"> <br />	
				
				비밀번호는 6글자 이상, 16글자 이하 , !,@,#,$,% 의 특수문자가 들어가야 합니다.
							
				<h2>비밀번호 확인</h2>
				<input type="password" name="joinPwd2" id="pw2" onchange="check_pw()">&nbsp;<span id="check"></span>

				<h2>연락처</h2>
				<input type="tel" name="joinTel" id="" value="<%= member.getTel() %>" />

				<h2>이메일</h2>
				<input type="email" name="joinEmail" id="" value="<%= member.getEmail() %>"/>

				<h2>사업자등록번호</h2>
				<input type="text" name="joinBus" id="" value="<%= member.getBus() %>"/>


			</fieldset>
			

			<br /> 
			<input type="submit" value="수정 완료" />
			
			<button type="button" value="나가기" onclick="location.href='/WithKitchen/member/main.jsp'" >나가기</button>
			<br />
			<button type="button" value="회원 탈퇴" onclick="location.href='/WithKitchen/member/memberDel.jsp'" >회원 탈퇴</button>
			

		</form>
	</div>
</body>
</html>