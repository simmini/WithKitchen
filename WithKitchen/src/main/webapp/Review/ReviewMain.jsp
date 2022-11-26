
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.84.0">
    <title>리뷰작성</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">

    

    <!-- Bootstrap core CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.0/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.0/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.0/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      
       #myform fieldset {
        display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
        border: 0; /* 필드셋 테두리 제거 */
      }
      #myform input[type="radio"] {
        display: none; /* 라디오박스 감춤 */
      }
      #myform label {
        font-size: 3em; /* 이모지 크기 */
        color: transparent; /* 기존 이모지 컬러 제거 */
        text-shadow: 0 0 0 #7c7c7c; /* 새 이모지 색상 부여 */
      }
      #myform label:hover {
        text-shadow: 0 0 0 rgb(248, 252, 55); /* 마우스 호버 */
      }
      #myform label:hover ~ label {
        text-shadow: 0 0 0 rgb(248, 252, 55); /* 마우스 호버 뒤에오는 이모지들 */
      }
      #myform fieldset {
        display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
        direction: rtl; /* 이모지 순서 반전 */
        border: 0; /* 필드셋 테두리 제거 */
      }
      #myform fieldset legend {
        text-align: left;
      }
      #myform input[type="radio"]:checked ~ label {
        text-shadow: 0 0 0 rgb(248, 252, 55); /* 마우스 클릭 체크 */
      }
       
      
    </style>

    
     
    <!-- Custom styles for this template -->
    <link href="signin.css" rel="stylesheet">
    </head>
  
  
<body class="text-center">
<form>
</form>
  
     
<main class="form-signin-sm">

   <fieldset>
  <div class="row g-3">
   

  <div class="w-25 p-3" style="background-color: #eee;">
  
  <hr>
 
  <form name="myform" id="myform" method="post" action="UploadProcess.jsp" enctype="multipart/form-data">
    <h1 class="h3 mb-3 fw-normal"><b>Review<b></b></h1>
    
      <hr>
    

    <div class="form--sm">
      <input type="text" class="form-control" id="floatingInput" name="REV_POTO_NAME" placeholder="주방 이름을 입력해주세요.">
      <label for="floatingInput"></label>
    </div>
    
    <div class="form-sm">
      <input type="text" class="form-control" id="floatingInput" name="REV_POTO_TITLE" placeholder="사진의 한줄명을 입력해주세요.">
      <label for="floatingPassword"></label>
    </div>
<div class="input-group">
  <input type="file" class="form-control" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
  <button class="btn btn-outline-secondary" type="button" id="inputGroupFileAddon04">Upload</button>
</div>
    
    <form>
     <!-- 별점 -->
        <input type="radio" name="REV_GRADE" value="5" id="rate1" /><label
          for="rate1"
          >⭐</label
        >
        <input type="radio" name="REV_GRADE" value="4" id="rate2" /><label
          for="rate2"
          >⭐</label
        >
        <input type="radio" name="REV_GRADE" value="3" id="rate3" /><label
          for="rate3"
          >⭐</label
        >
        <input type="radio" name="REV_GRADE" value="2" id="rate4" /><label
          for="rate4"
          >⭐</label
        >
        <input type="radio" name="REV_GRADE" value="1" id="rate5" /><label
          for="rate5"
          >⭐</label>         
          <br>
          <div class="mb-3">
        <label for="REV_TEXT" class="form-label"></label>
        <textarea class="form-control" id="REV_TEXT" placeholder="ㅎㅏ고싶은말" rows="5" ></textarea>
      </div>
      
    </form>
   
    <button class="w-100 btn btn-lg btn-primary" type="submit">리뷰 작성</button>
    <p class="mt-5 mb-3 text-muted">&copy; 2022 With Kitchen</p>
    
    
    
  </form>
</div>
</div>
  
</main>

    
  </body>
</html>