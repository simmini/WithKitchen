<%@ page import="utils.*" %>
<%@ page import="membership.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
          
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.84.0">
    <title>예약정보 확인</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/checkout/">

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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
  <script src="form-validation.js"></script>

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
    </style>
    <!-- Custom styles for this template -->
  </head>

  <body class="bg-light">
  <div class="container">
  <main>
    <div class="py-5 text-center">
    <div class="card bg-dark text-white">
    <img src="/WithKitchen/resource/images/pixabay1.png" class="card-img" alt="...">
    <div class="card-img-overlay">
     <figure class="text">
     <blockquote class="blockquote">
     <br>
     <br>
     <br>
     <br>
     <br>
    <p>&nbsp;&nbsp; &nbsp; The shared kitchen can be a new way of expanding your business. </p>
     </blockquote>
    </div>
    </div>      
      <br>
      <br>
      <br>
      <hr>
      <h2>예약정보를 확인하세요.</h2>
      <hr>
    </div>

    <div class="row g-5">
      <div class="col-md-5 col-lg-4 order-md-last">
        <h4 class="d-flex justify-content-between align-items-center mb-3">
          <span class="text-primary">예약내역</span>
          <span class="badge bg-primary rounded-pill"></span>
        </h4>
        <ul class="list-group mb-3">
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0" >예약 날짜</h6>
            </div>
              <span class="text-muted" id="res_date">YYYY/MM/DD</span>
          </li>
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0" id="res_time">예약 시간</h6>            
            </div>
            <span class="text-muted">24H</span>
          </li>
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0" id="res_people">예약 인원</h6>           
            </div>
            <span class="text-muted">명</span>
          </li>
          <li class="list-group-item d-flex justify-content-between" id="RES_MONEY">
            <span id="total_price">Total (KRW)</span>
            <strong>원</strong>
          </li>   
          <li class="list-group-item d-flex justify-content-between">
           <div class="d-grid gap-2 col-12 mx-auto">
           <button class="btn btn-primary" type="submit">문의하기</button>
       </div>
          </li>          
        </ul>
      </div>
      <div class="col-md-7 col-lg-8">
        <h4 class="mb-3">예약정보</h4>
        <form class="needs-validation" novalidate>
          <div class="row g-3">
  
             <div class="col-12">
              <label for="RES_NO" class="form-label">예약번호 <span class="text-muted"></span></label>
            <input class="form-control" id="RES_NO" type="text" value="Readonly input here..." aria-label="readonly input example" readonly>
            </div>
            
            <div class="col-12">
              <label for="RES_COMPLETE" class="form-label">승인대기 기한 <span class="text-muted"></span></label>
            <input class="form-control" id="RES_COMPLETE" type="text" value="Readonly input here..." aria-label="readonly input example" readonly>
            </div>
            
            <div class="col-12">
              <label for="RES_START" class="form-label">신청일<span class="text-muted"></span></label>
            <input class="form-control" id="RES_START" type="text" value="Readonly input here..." aria-label="readonly input example" readonly>
            </div>
            
             <div class="col-12">
              <label for="KIT_NAME" class="form-label">예약공간 <span class="text-muted"></span></label>
            <input class="form-control" id="KIT_NAME" type="text" value="Readonly input here..." aria-label="readonly input example" readonly>
            </div>
            
             <div class="col-12">
              <label for="RES_DETAIL" class="form-label">예약내용 <span class="text-muted"></span></label>
            <input class="form-control" id="RES_DETAIL" type="text" value="Readonly input here..." aria-label="readonly input example" readonly>
            </div>
            
              <div class="col-12">
              <label for="RESPEOPLE" class="form-label">예약인원 <span class="text-muted"></span></label>
            <input class="form-control" id="RES_PEOPLE" type="text" value="Readonly input here..." aria-label="readonly input example" readonly>
            </div>
            
               <div class="col-12">
              <label for="ADD_OPTION" class="form-label">추가옵션 <span class="text-muted"></span></label>
            <input class="form-control" id="ADD_OPTION" type="text" value="Readonly input here..." aria-label="readonly input example" readonly>
            </div>
            
             <div class="col-12">
              <label for="RES_REQUEST" class="form-label">요청사항<span class="text-muted"></span></label>
            <input class="form-control" id="RES_REQUEST" type="text" value="Readonly input here..." aria-label="readonly input example" readonly>
            </div>
            
              <div class="col-12">
              <label for="RES_PURPOSE" class="form-label">사용목적 <span class="text-muted"></span></label>
            <input class="form-control" id="RES_PURPOSE" type="text" value="Readonly input here..." aria-label="readonly input example" readonly>
            </div>
                      
          <hr class="my-4">
          <h4 class="mb-3">예약자 정보</h4>
              <div class="col-12">
              <label for="M_NAME" class="form-label">예약자명 <span class="text-muted"></span></label>
            <input class="form-control" id="M_NAME" type="text" value="Readonly input here..." aria-label="readonly input example" readonly>
            </div>
            
              <div class="col-12">
              <label for="M_TEL" class="form-label">연락처 <span class="text-muted"></span></label>
            <input class="form-control" id="M_TEL" type="text" value="Readonly input here..." aria-label="readonly input example" readonly>
            </div>
            
              <div class="col-12">
              <label for="M_EMAIL" class="form-label">이메일 <span class="text-muted"></span></label>
            <input class="form-control" id="M_EMAIL" type="text" value="Readonly input here..." aria-label="readonly input example" readonly>
            </div>


 <hr class="my-4">

          <h4 class="mb-3">거북이의 주방</h4>
          
           <ul type="none" >
              <li>거북이의 주방</li>
              <hr>
              <li>서울 마포구 백범로1길 8-7 지하1층</li>
              <li>0507-1383-0892</li>
              <li>  
                <div id="button">
                  <a href="tel:호스트연락처"> <input type="button" class="btn btn-outline-success" value="전화걸기"></a> 
                </div id="button">
                  <a href="https://map.naver.com/v5/entry/place/35915198?c=14130189.6387539,4516626.5850942,15,0,0,0,dh.html">
                  <input type="button"  class="btn btn-outline-success" value="길찾기"></a><br>
                  <img src="" alt="">
                </div>
              </li>
            </ul>
            
    
          <hr class="my-4">
          <button class="w-50 btn btn-outline-primary btn-lg" type="button">수정하기</button>
          <button class="w-50 btn btn-outline-secondary btn-lg" type="button"  onclick="location.href='/WithKitchen/reservation/ResCancel.jsp'">취소하기</button>   
               
      </div>
    </div>
  </main>

  <footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">&copy; 2022 WITH KITCHEN</p>
    <ul class="list-inline">
      <li class="list-inline-item"><a href="#">Privacy</a></li>
      <li class="list-inline-item"><a href="#">Terms</a></li>
      <li class="list-inline-item"><a href="#">Support</a></li>
    </ul>
  </footer>
</div>

  </body>
</html>