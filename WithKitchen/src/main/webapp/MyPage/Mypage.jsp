<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="membership.MemberCheckDTO" %>    
<%@ page import ="common.DBConnPool" %>
<%@ page import ="MyPage.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>�α����� ����������</title>
  <!--    
    <style>
    * {
     box-sizing: border-box;
    }
    body {
    background-color:#eee;
    font-size:16px;
    }
    .mypagemain{
        width: 950px;
        margin: 0px auto;
    }    
    
    
        /*������ ���� �ڽ�*/
    .box {
    width: 150px;
    height: 150px; 
    border-radius: 70%;
    overflow: hidden;
    }
    .profile {
    width: 100%;
    height: 100%;
    object-fit: cover;
    }
    .accent{
    color: rgb(10, 10, 10);
    
    }
    fieldset{
        width: 150px;
        height: 0px auto;
    }
    #logout{
        float: right;
    }
    ul li{
        list-style: image();
        float: left;
        list-style: none;
        
    }
    .hrL{
        width : 50%;
        float: left;
    }
    .hrS{
        width: 25%;
        float: left;
    }
    
    
    </style>
    -->
</head>
<body>
	<a href="../member/main.jsp">Home</a>
    <div class="mypagemain">
    <h1><span class="accent"><label for="mypage">MYPAGE</label></span></h1>
    
  
   <form>
   <%= session.getAttribute("UserName") %>
   
   </form>         
    
    </div>
    
    <label for="logout"><a href="Logout.jsp">�α׾ƿ�</a></label>
    <br>
    <hr class="hrL">
    <br>
    
        <lable for="cus_mag">���� ����</lable>
        <br><br>
     <hr class="hrS">
        <br>
        <ul>
        <li><label for=""><a href="../member/memberUpdate.jsp">������ ����</a></label></li>
        <!--<li><label for="cus_drop"><input type="button" value="ȸ�� Ż�� "></label></li>--> <!-- ȸ�� Ż��-->
        </ul>
    <br><br>
    <hr class="hrS">
    <br>
        <label for="">����</label>
        <br><br>
    <hr class="hrS">
        <br>
        <ul>
            <li><label for=""><a href="../reservation/ReservationCheck.jsp">����Ȯ��</a></label></li>
       <!--<li><a href=""><label><input type="button" value="���䳲���"></label></a></li>--> <!--���䳲��� -->
        </ul>
        <br><br>
    <hr class="hrS">
        <br>
        <label>������</label>
        <br><br>
    <hr class="hrS">
        <br>
        <ul>
        <li><label for="cus_cange"><a href="../Goggi/GoggiMain.jsp">��������</a></label></li>    <!--�������� ����Ʈ�� �̵�-->
       <br>
       <br>
       <div class="kakao">
       <li><a href="https://open.kakao.com/o/swQgVaAe"><label class="kakaolink">1:1 ����</label></a></li> <!--īī���� ����ä�ù� �̵�-->
        </div>
    </ul>
    

    </div>
</body>
</html>