
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>

<script type="text/javascript">

	function idCheck(){
	//새창을 열어서 페이지를 오픈 후 -> 회원아이디정보를 가지고 중복체크
	window.name = "parentForm";
	
	window.open("idCheckForm.jsp", "", "width=400, height=350");
	}
	
	
</script>

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
		<form action="memberJoinProcess.jsp" method="post" name="joinFrm">

			<fieldset>

				<label>아이디</label> 
				
				<input type="text" name="joinId" id="pInput" size="15"  readonly>
				<input type="button" value="ID중복확인" onclick="idCheck()">
				
				<br>

				<br /> 아이디는 5글자 이상 입력해 주세요
				
				<h2>비밀번호</h2>
				<input type="password" name="joinPwd" id="pw" onchange="check_pw()"> <br />	
				
				비밀번호는 6글자 이상, 16글자 이하 , !,@,#,$,% 의 특수문자가 들어가야 합니다.
							
				<h2>비밀번호 확인</h2>
				<input type="password" name="joinPwd2" id="pw2" onchange="check_pw()">&nbsp;<span id="check"></span>

				<h2>이름</h2>
				<input type="text" name="joinName" id="" placeholder="" />

				<h2>연락처</h2>
				<input type="tel" name="joinTel" id="" />

				<h2>이메일</h2>
				<input type="email" name="joinEmail" id="" />

				<h2>사업자등록번호</h2>
				<input type="text" name="joinBus" id="" />


			</fieldset>
			
			

			<br /> <input type="submit" value="가입하기" />
		</form>
	</div>
</body>
</html>