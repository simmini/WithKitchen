<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    
    <style>
        .gonggimain{
          width: 950px;
          margin: 0px auto;
          justify-content : center
        }
        .search {
        position: relative;
        width: 300px;
        
        }
        
        .linear{  /*공지 내용 창*/
        
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
         }
        .gonggi_text{ /*공지 내용*/
          text-align: center;
          background-color: #494b48;
          word-break: keep-all;
          width: 800px;
          height: 200px;
          padding: auto;
          resize: none;
          color: white;
          font-size: 20px;
          border: none;
          outline: none;

          
        } 
        .linear h1 {  /*공지 제목*/
          font-size: 1.2rem;
          padding: 0.3rem;
        }
        #gonggi div{ /*공지내용 창 옵션*/
      
        width:1000px;
        height:50px ;
        margin:10px 10px;
        padding:15px;
        color:white;
        background-color:#494b48;
        border-radius:5px;
        text-align:center;
        font-weight:bold;	
        }
        
        #gonggi:hover div{ /*공지내용 창 크기*/
        
        height:auto ;
        }
   
        #gonggi .linear{ /*공지 내용창 펼치기 속도*/
        transition:0.1s linear;
        }
        
       
        
  </style>
  <script>
    function adjustHeight() {
    var textEle = $('textarea');
    textEle[0].style.height = 'auto';
    var textEleHeight = textEle.prop('scrollHeight');
    textEle.css('height', textEleHeight);
    };
  </script>
    
</head>
<body>
    <div class="gonggimain">
    <a href=../member/main.jsp >Home</a>
        <h1><label>공지사항</label></h1>
        
        
          <hr>
          <div id="gonggi">
        
           <div class="linear">
            <label class="gonggimemo">
              <h1>[공지사항] 공지제목</h1>
              <br>
              <textarea class="gonggi_text" readonly onkeyup="this.style.height='26px'; this.style.height = this.scrollHeight + 'px';">test 공지사항 내용입니다. test 공지사항 내용입니다. test 공지사항 내용입니다. test 공지사항 내용입니다. test 공지사항 내용입니다.test 공지사항 내용입니다.test 공지사항 내용입니다.test 공지사항 내용입니다.test 공지사항 내용입니다.</textarea>
            </label>
          </div>           
          </div>
          <div id="gonggi">
        
            <div class="linear"><label class="gonggimemo">
              <h1>[공지사항] 공지제목</h1>
              <textarea class="gonggi_text" readonly>Enim amet Lorem cillum ut ea exercitation adipisicing qui minim voluptate aute velit.Anim id anim officia officia ex ex ipsum occaecat ex aliqua.</textarea>
              
            </label>
          </div>           
           </div>
          
     
          
          <hr>
          <footer> footer </footer>
</body>
</html>
