<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
  <meta name="generator" content="Hugo 0.84.0">
  <title>글쓰기</title>

  <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/navbar-static/">



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
  <link href="navbar-top.css" rel="stylesheet">
</head>

<body>


  <!--시작-->
  
<form name="writeFrm" method="post" enctype="multipart/form-data" action="Post_writeprocess.jsp"><!-- this=form을 준다. -->
  <div class="container-xl">
    <br>
    <h3>주방 정보를 입력해주세요.</h3>
    <br>

    <div class="mb-3">
      <label for=""class="form-label">주방이름*</label>
      <input type="text" class="form-control" id="kit_name" name="kit_name" value="김밥" placeholder="고유 업체명을 입력해주세요. (예시) 거북이의 주방" required
        autofocus>
    </div>
    
    <div class="mb-3">
      <label class="form-label">예약인원*</label>
      <input type="text" class="form-control" name="kit_cap" value="11" placeholder="예약 가능한 인원을 입력해주세요. (예시) 최소 1명 ~ 최대 13명" required
        autofocus>
    </div>
    
     <div class="mb-3">
      <label class="form-label">추가인원*</label>
      <input type="text" class="form-control" name="kit_add" value="1" placeholder="인원 초과 시 추가되는 비용을 입력해주세요. (예시) 2명 초과시 10,000원/인" required
        autofocus>
    </div>

    <div class="mb-3">
      <label class="form-label">시설안내*</label>
      <textarea class="form-control" name="kit_info" value="안녕" rows="" placeholder="이용 가능한 시설에 대해서 10개 이내로 입력해주세요." required>와이파이 보유,최대 규모</textarea>
    </div>

		<div class="mb-3">
      <p>아래 항목에 해당되는 시설이 있으면 선택해주세요.</p><!-- 체크박스에 name수정 -->
      <div class="card">
        <div class="row">

          <div class="col-lg-4">
            <div class="card border-0">
              <div class="card-body">
                <p class="card-text">
                  <div class="form-check">
                    <input class="form-check-input" name="opt" type="checkbox" value="opt_smoking" id="flexCheckDefault" checked>
                    <label class="form-check-label" for="flexCheckDefault">
                      금연
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" name="opt" type="checkbox" value="opt_parking" id="flexCheckChecked" checked>
                    <label class="form-check-label" for="flexCheckChecked">
                      주차
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" name="opt" type="checkbox" value="opt_hot_water" id="flexCheckChecked">
                    <label class="form-check-label" for="flexCheckChecked">
                      온수
                    </label>
                  </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4">
            <div class="card border-0">
              <div class="card-body">
                <p class="card-text">
                  <div class="form-check">
                    <input class="form-check-input" name="opt" type="checkbox" value="opt_wifi" id="flexCheckDefault">
                    <label class="form-check-label" for="flexCheckDefault">
                      인터넷/WIFI
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" name="opt" type="checkbox" value="opt_mart" id="flexCheckChecked">
                    <label class="form-check-label" for="flexCheckChecked">
                      마트/편의점
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" name="opt" type="checkbox" value="opt_liquor" id="flexCheckChecked">
                    <label class="form-check-label" for="flexCheckChecked">
                      주류반입가능
                    </label>
                  </div>
              </div>
            </div>
          </div>


          <div class="col-lg-4">
            <div class="card border-0">
              <div class="card-body">
                <p class="card-text">
                  <div class="form-check">
                    <input class="form-check-input" name="opt" type="checkbox" value="opt_tv" id="flexCheckDefault">
                    <label class="form-check-label" for="flexCheckDefault">
                      TV/프로젝터
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" name="opt" type="checkbox" value="opt_chair" id="flexCheckChecked">
                    <label class="form-check-label" for="flexCheckChecked">
                      의자/테이블
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" name="opt" type="checkbox" value="opt_whiteboard" id="flexCheckChecked">
                    <label class="form-check-label" for="flexCheckChecked">
                      화이트보드
                    </label>
                  </div>
              </div>
            </div>
          </div>


        </div>
        <br>
      </div>
      <br>
	
      <p>대여 시작 및 종료 기간을 선택해주세요.*</p>
     
        
	<div class="mb-3">
      <div class="input-group mb-3">
  		<span class="input-group-text">대여시작일</span>
  		<input type="text" class="form-control" name="res_start" value="20221013" aria-label="RES_START" required>
  		
	  </div>
    </div>
   <br>
          
          
	<div class="mb-3">
      <div class="input-group mb-3">
  		<span class="input-group-text">대여종료일</span>
  		<input type="text" class="form-control" name="res_end" value="20221014" aria-label="RES_END" required>
  		
	  </div>
    </div>
   <br>
          
       

	<div class="mb-3">
      <div class="input-group mb-3">
  		<span class="input-group-text">희망 대여금액(시간당)*</span>
  		<input type="text" class="form-control" name="res_fee" aria-label="RES_FEE" value="10000" required>
  		<span class="input-group-text">원</span>
	  </div>
    </div>
   <br>
       
    <div class="input-group">
  	<span class="input-group-text">연락처*</span><!-- 연락처 name필요 -->
  	<input type="text" aria-label="KIT_TEL" name="kit_tel" class="form-control" value="01011112222" required>
  	
	</div>
	<br>
    
     <p>주소(위치)*</p>
       <div class="input-group mb-3">
  		<input type="text" class="form-control" name="kit_address_1st" aria-label="KIT_ADDRESS_1st" value="신촌 서강대로" aria-describedby="button-addon2" required>
  		<button class="btn btn-secondary" type="button" id="button-addon2">주소검색</button>
		</div>
  		 <input type="text" class="form-control" name="kit_address_2nd" placeholder="상세주소를 입력해주세요." value="ict학원" aria-label="KIT_ADDRESS_2nd" aria-describedby="button-addon2" required>
      <br>
    <!-- 여기서 부턴 name지정 필요 -->
    <p>주방의 대표 이미지 한 장을 업로드해주세요.*</p>
    <div class="input-group mb-3">
  	<input type="file" class="form-control" name="attachedFile" required>
  	<label class="input-group-text" for="KIT_IMG">Upload</label>
	</div>
    
    <div class="mb-3">
        <label for="KIT_INTRO" class="form-label">한 줄 소개</label>
        <textarea class="form-control" id="KIT_INTRO"  name="kit_intro" value="안녕하세요!" placeholder="주방의 특장점을 한 문장으로 작성해주세요." rows="3">안뇽하세요</textarea>
      </div>
    
      <div class="mb-3">
        <label for="KIT_TAG" class="form-label">태그*</label>
        <textarea class="form-control" name="kit_tag" id="KIT_TAG" placeholder="주방의 특장점을 5개의 키워드 형태로 입력해주세요. (예시) #신촌역 6번 출구 #도보 5분 #일식 주방 #야간 임대 가능 # 수용인원 50명" rows="3" required>#신촌역 6번 출구#도보 5분 </textarea>
      </div>  
      
      <label for="KIT_URL" class="form-label">웹사이트</label>
	  <div class="input-group mb-3">
      <span class="input-group-text" id="basic-addon3"> URL </span>
  	  <input type="text" class="form-control" id="KIT_URL" name="kit_url" value="www.naver.com" aria-describedby="basic-addon3" placeholder="(예시) https://example.com/users/">
	  </div>

   	   <div class="mb-3">
        <label for="KIT_NOTICE" class="form-label">예약 시 주의사항</label>
        <textarea class="form-control" id="KIT_NOTICE" name="kit_notice" value="주의사항" placeholder="게스트들이 예약시 확인해야 하는 주의사항을 10개 이내로 입력해주세요." rows="3">주의사항</textarea>
      </div>
		
	 <center>
	   <input class="btn btn-secondary btn-lg" type="reset" value="취소하기">      
       <input class="btn btn-secondary btn-lg" type="submit" value="저장하기">
	 </center>
	 <br>
	  <br>
	 
	
    </div>
  </div>
  <br>
  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
  </script>

</body>

</html>

<body>

</body>
</html>