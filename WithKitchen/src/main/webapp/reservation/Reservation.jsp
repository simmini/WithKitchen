<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!doctype html>
<html lang="ko">

<head>
  <meta charset="utf-8">
 
  <title>예약하기</title>

  <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/checkout/">

  <!-- Bootstrap core CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <!-- Favicons -->
  <link rel="apple-touch-icon" href="/docs/5.0/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
  <link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
  <link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
  <link rel="manifest" href="/docs/5.0/assets/img/favicons/manifest.json">
  <link rel="mask-icon" href="/docs/5.0/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
  <link rel="icon" href="/docs/5.0/assets/img/favicons/favicon.ico">
  <meta name="theme-color" content="#7952b3">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
  </script>
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
  <link href="form-validation.css" rel="stylesheet">
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
        <h2>주방을 예약하세요.</h2>
 
        <hr>
      </div>
<form name="ResFrm" method="post" action="ResProcess.jsp" onsubmit="return validateForm(this)" >
        
      <div class="row g-5">
        <div class="col-md-5 col-lg-4 order-md-last">
          <h4 class="d-flex justify-content-between align-items-center mb-3">
           <span class="text-primary">예약정보</span>
            <span class="badge bg-primary rounded-pill"></span>
          </h4>
          <ul class="list-group mb-3">
            <li class="list-group-item d-flex justify-content-between lh-sm">
              <div>
                <h6 class="my-0">예약 날짜</h6> 
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

            <li class="list-group-item d-flex justify-content-between">
              <span id="total_price">Total (KRW)</span>
              <strong>원</strong>
            </li>

            <li class="list-group-item d-flex justify-content-between">
              <div class="d-grid gap-2 col-12 mx-auto">
               <button class="btn btn-primary" type="button">문의하기</button>
               
                
              </div>
            </li>
          </ul>

        </div>
              
       
       
        <div class="col-md-7 col-lg-8">
        
		<h4 class="mb-3">주방정보</h4>
          <div class="card mb-3" style="max-width:800px; margin: 10px;">
            <div class="row g-0">
              <div class="col-md-4">
                <img src="/WithKitchen/resource/images/pixabay2.png" class="img-fluid rounded-start" alt="...">
              </div>

              <div class="col-md-8">
                <div class="card-body">
                
                 <h4 class="mb-3"> [예약주방명] KIT_NAME 끌어오기</h4>
                 <hr>
                 
                  <p class="card-text"><p> [시설안내문장] KIT_INFO 끌어오기 (예) This is a wider card with supporting text below as a natural lead-in to
                    additional content. This content is a little bit longer.</p>
                           
                </div>
              </div>
            </div>
          </div>

          <div class="col-12">
           <label for="kit_cap" class="form-label">예약가능인원</label>
         <input class="form-control" id="kit_cap" name="kit_cap" type="text" value="Readonly input here..."
              aria-label="readonly input example" readonly>
          </div>
          <br>

          <div class="col-12">
            <label for="kit_add" class="form-label">추가인원비용<span class="text-muted"></span></label>
            <input class="form-control" id="kit_add" name="kit_add" type="text" value="Readonly input here..."
              aria-label="readonly input example" readonly>
          </div>


    <hr class="my-4">

          <h4 class="mb-3">예약 선택*</h4>
          <br>
          
            <div class="row g-3">
            


                <div class="col-12">
                <label for="res_date" class="form-label">이용날짜* <span class="text-muted"></span></label>
                       <textarea class="form-control" id="res_date" name="res_date" placeholder="주방을 이용할 날짜를 입력해주세요 (예) 2023/01/29 오전 10시 ~ 2023/02/28 오후 8시" autofocus required rows="3"></textarea>

              </div>

			</div>
			<br>
              

              <div class="col-12">
                <label for="res_people" class="form-label">예약인원* <span class="text-muted"></span></label>
                 <input type="text" class="form-control" id="res_people" name="res_people" placeholder="주방을 이용할 인원을 입력해주세요 (예) 5명" autofocus required>
              </div>

              <hr class="my-4">

 <h4 class="mb-3">예약자 정보*</h4>

              <div class="col-12">
                <label for="m_name" class="form-label">예약자명* <span class="text-muted"></span></label>
                <input class="form-control" id="m_name" name="m_name" type="text" value="Readonly input here..."
                  aria-label="readonly input example" readonly>              </div>

         
              <div class="col-12">
                <label for="m_tel" class="form-label">연락처* <span class="text-muted"></span></label>
                <input class="form-control" id="m_tel" name="m_tel" type="text" value="Readonly input here..."
                  aria-label="readonly input example" readonly>
              </div>


              <div class="col-12">
                <label for="m_email" class="form-label">이메일* <span class="text-muted"></span></label>
                <input class="form-control" id="m_email" name="m_email" type="text" value="Readonly input here..."
                  aria-label="readonly input example" readonly>
              </div>
              
               <div class="col-12">
                <label for="res_purpose" class="form-label">사용목적 <span class="text-muted"></span></label>
                       <textarea class="form-control" id="res_purpose" name="res_purpose" placeholder="촬영, 파티, 모임, 수업 등 주방의 사용 목적을 입력해주세요." rows="3"></textarea>

              </div>
              
               <div class="col-12">
                <label for="res_request" class="form-label">요청사항<span class="text-muted"></span></label>
                  <textarea class="form-control" id="res_request" name="res_request" placeholder="남기고 싶은 말을 적어주세요." rows="3"></textarea>

              </div>
                </form>
              
              <p>예약자 정보로 알림톡과 이메일이 발송됩니다. 정확한 정보인지 확인해주세요.</p>

 <hr class="my-4">

<h4 class="mb-3">호스트 정보</h4>

              <div class="col-12">
               <label for="kit_name" class="form-label">주방상호 <span class="text-muted"></span></label>
                <input class="form-control" id="kit_name" name="kit_name" type="text" value="Readonly input here..."
                  aria-label="readonly input example" readonly>
              </div>

              <div class="col-12">
                <label for="m_name" class="form-label">대표자명 <span class="text-muted"></span></label>
                <input class="form-control" id="m_name" name="m_name" type="text" value="Readonly input here..."
                  aria-label="readonly input example" readonly>
              </div>
              
                <div class="col-12">
               <label for="kit_address" class="form-label">소재지 <span class="text-muted"></span></label>
                <input class="form-control" id="kit_address" name="kit_address" type="text" value="Readonly input here..."
                  aria-label="readonly input example" readonly>
              </div>

              <div class="col-12">
                <label for="m_bus" class="form-label">사업자번호 <span class="text-muted"></span></label>
                <input class="form-control" id="m_bus" name="m_bus" type="text" value="Readonly input here..."
                  aria-label="readonly input example" readonly>
              </div>
              
                <div class="col-12">
               <label for="m_tel" class="form-label">연락처 <span class="text-muted"></span></label>
                <input class="form-control" id="m_tel" name="m_tel" type="text" value="Readonly input here..."
                  aria-label="readonly input example" readonly>
              </div>
              
              
              <hr class="my-4">
              
               <button class="btn btn-primary" type="submit">예약하기</button>
               
               <button class="btn btn-secondary" type="button" value="취소하기" onclick="location.href='/WithKitchen/member/main.jsp'" >취소하기</button>

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