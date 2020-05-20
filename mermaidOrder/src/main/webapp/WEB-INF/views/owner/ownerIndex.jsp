<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>머메이드오더 점주 지원</title>
    <meta name="description" content=""/>
    <link href="https://use.fontawesome.com/releases/v5.0.9/css/all.css" rel="stylesheet">
    <link href="${path }/resources/css/aos.css" rel="stylesheet">
    <link href="${path }/resources/css/ekko-lightbox.css" rel="stylesheet">
    <link href="${path }/resources/styles/bootstrap.css" rel="stylesheet">
    <link href="${path }/resources/styles/main.css" rel="stylesheet">
    <style>
		.auth {
		  min-height: 100vh;
		}
	    .auto-form-wrapper {
	      background: $card-bg;
	      padding: 40px 40px 10px;
	      border-radius: 4px;
	      box-shadow: 0 -25px 37.7px 11.3px rgba(8, 143, 220, 0.07);
		}
        .input-group {
          height: 44px;
		}
         .form-control {
           border: 1px solid darken($border-color, 5%);
           border-right: none;
           border-radius: 6px 0 0 6px;
           height: 44px;
           line-height: 4px;
           display: inline-block;
           padding-top: 0px;
           padding-bottom: 0px;
             }

         .input-group-append {
           border-left: none;
	   }
           .input-group-text {
             border-radius: 0 6px 6px 0;
             border-left: none;
             border-color: darken($border-color, 5%);
             color: #b6b6b6;
           }

          .submit-btn {
          font-family: $type-1;
          font-size: 13px;
          padding: 12px 8px;
          font-weight: 600;
        }

      .g-login {
        border: 1px solid $border-color;
        padding: 13px;
        font-size: 12px;
        font-weight: 600;
        background: transparent;
      }

      .input-group-text {
      	background-color:#fff;
      }
    </style>
	<div class="modal" id="loginModal">
		<div class="modal-dialog">
			<div class="modal-content modal-dialog-centered">
				<div class="container">
					<div class="auto-form-wrapper">
						<form id="loginEnd" action="${path }/owner/ownerLogin.do" method="post">
							<div class="form-group">
							  <label class="label">아이디</label>
							  <div class="input-group">
							    <input type="email" class="form-control" placeholder="아이디를 이메일 주소로 입력하세요" name="id" autocomplete="off">
   							    <div class="input-group-append">
							      <span class="input-group-text"></span>
   							    </div>
							  </div>
							</div>
							<div class="form-group">
							  <label class="label">비밀번호</label>
							  <div class="input-group">
							    <input type="password" class="form-control" placeholder="비밀번호를 입력하세요" name="password">
   							    <div class="input-group-append">
							      <span class="input-group-text"></span>
   							    </div>
							  </div>
							</div>
							<div class="form-group">
							  <button class="btn btn-primary submit-btn btn-block">로그인</button>
							</div>
							<div class="form-group d-flex justify-content-between">
							  <div class="form-check form-check-flat mt-0">
							    <label class="form-check-label"></label>
							  </div>
							  <!-- <a href="#" class="text-small forgot-password text-black">비밀번호 찾기</a> -->
							</div>
							<!-- <div class="form-group">
							  <button class="btn btn-block g-login">
							    <img class="mr-3" src="../../../assets/images/file-icons/icon-google.svg" alt="">Log in with Google</button>
							</div> -->
							<div class="text-block text-center my-3">
							  <span class="text-small font-weight-semibold">점주 가입을 원하시나요?</span>
							  <a class="join" href="javascript:void(0);" class="text-black text-small">점주 가입하기</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal" id="joinModal">
		<div class="modal-dialog">
			<div class="modal-content modal-dialog-centered">
				<div class="container">
					<div class="auto-form-wrapper">
						<form id="joinEnd" action="${path }/owner/ownerEnrollEnd.do" method="post" onsubmit="return validate();">
							<div class="form-group">
							  <label class="label">아이디</label>
							  <div class="input-group">
							    <input id="id" type="email" class="form-control" placeholder="abc@email.com" name="id" required>
							    <div class="input-group-append">
							      <span class="input-group-text">
							        <svg id="alert-idSuccess" class="bi bi-check" width="1em" height="1em" viewBox="0 0 20 20" fill="green" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" d="M15.854 5.646a.5.5 0 010 .708l-7 7a.5.5 0 01-.708 0l-3.5-3.5a.5.5 0 11.708-.708L8.5 12.293l6.646-6.647a.5.5 0 01.708 0z" clip-rule="evenodd"></path>
                                    </svg>
                                    <svg id="alert-idDanger" class="bi bi-x" width="1.2em" height="1.2em" viewBox="0 0 20 20" fill="red" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" d="M5.646 5.646a.5.5 0 000 .708l8 8a.5.5 0 00.708-.708l-8-8a.5.5 0 00-.708 0z" clip-rule="evenodd"></path>
                                        <path fill-rule="evenodd" d="M14.354 5.646a.5.5 0 010 .708l-8 8a.5.5 0 01-.708-.708l8-8a.5.5 0 01.708 0z" clip-rule="evenodd"></path>
                                    </svg>
                                    <svg id="alert-idDuplicate" class="bi bi-x" width="1.2em" height="1.2em" viewBox="0 0 20 20" fill="red" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" d="M5.646 5.646a.5.5 0 000 .708l8 8a.5.5 0 00.708-.708l-8-8a.5.5 0 00-.708 0z" clip-rule="evenodd"></path>
                                        <path fill-rule="evenodd" d="M14.354 5.646a.5.5 0 010 .708l-8 8a.5.5 0 01-.708-.708l8-8a.5.5 0 01.708 0z" clip-rule="evenodd"></path>
                                    </svg>
							      </span>
							    </div>
							  </div>
							</div>
							<div class="form-group">
							  <label class="label">비밀번호</label>
							  <div class="input-group">
							    <input id="pw1" type="password" class="form-control" placeholder="8글자 이상 입력하세요" name="password" required>
							    <div class="input-group-append">
							      <span class="input-group-text">
							        <svg id="alert-pw1Success" class="bi bi-check" width="1em" height="1em" viewBox="0 0 20 20" fill="green" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" d="M15.854 5.646a.5.5 0 010 .708l-7 7a.5.5 0 01-.708 0l-3.5-3.5a.5.5 0 11.708-.708L8.5 12.293l6.646-6.647a.5.5 0 01.708 0z" clip-rule="evenodd"></path>
                                    </svg>
                                    <svg id="alert-pw1Danger" class="bi bi-x" width="1.2em" height="1.2em" viewBox="0 0 20 20" fill="red" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" d="M5.646 5.646a.5.5 0 000 .708l8 8a.5.5 0 00.708-.708l-8-8a.5.5 0 00-.708 0z" clip-rule="evenodd"></path>
                                        <path fill-rule="evenodd" d="M14.354 5.646a.5.5 0 010 .708l-8 8a.5.5 0 01-.708-.708l8-8a.5.5 0 01.708 0z" clip-rule="evenodd"></path>
                                    </svg>
							      </span>
							    </div>
							  </div>
							</div>
							<div class="form-group">
							  <label class="label">비밀번호 확인</label>
							  <div class="input-group">
							    <input id="pw2" type="password" class="form-control" placeholder="동일하게 입력하세요" required>
							    <div class="input-group-append">
							      <span class="input-group-text">
							        <svg id="alert-pw2Success" class="bi bi-check" width="1em" height="1em" viewBox="0 0 20 20" fill="green" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" d="M15.854 5.646a.5.5 0 010 .708l-7 7a.5.5 0 01-.708 0l-3.5-3.5a.5.5 0 11.708-.708L8.5 12.293l6.646-6.647a.5.5 0 01.708 0z" clip-rule="evenodd"></path>
                                    </svg>
                                    <svg id="alert-pw2Danger" class="bi bi-x" width="1.2em" height="1.2em" viewBox="0 0 20 20" fill="red" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" d="M5.646 5.646a.5.5 0 000 .708l8 8a.5.5 0 00.708-.708l-8-8a.5.5 0 00-.708 0z" clip-rule="evenodd"></path>
                                        <path fill-rule="evenodd" d="M14.354 5.646a.5.5 0 010 .708l-8 8a.5.5 0 01-.708-.708l8-8a.5.5 0 01.708 0z" clip-rule="evenodd"></path>
                                    </svg>
							      </span>
							    </div>
							  </div>
							</div>
							<div class="form-group">
							  <button type="button" class="btn btn-primary submit-btn btn-block joinStart">가입하기</button>
							</div>
							<!-- <div class="form-group">
							  <button class="btn btn-block g-login">
							    <img class="mr-3" src="../../../assets/images/file-icons/icon-google.svg" alt="">Log in with Google</button>
							</div> -->
							<div class="text-block text-center my-3">
							  <span class="text-small font-weight-semibold">로그인 하고 싶으신가요?</span>
							  <a class="login" href="javascript:void(0);" class="text-black text-small">로그인하기</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<c:if test="${not empty loginOwner }">
		<div class="modal" id="ownerUpdateModal">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="container">
						<div class="auto-form-wrapper">
							<form id="updateEnd" action="${path }/owner/ownerUpdateEnd.do" method="post" onsubmit="return validate2();">
								<div class="form-group">
								  <label class="label">아이디</label>
								  <div class="input-group">
								    <input id="uid" type="hidden" class="form-control" placeholder="abc@email.com" name="id" value="${loginOwner.id }">
								    <span><c:out value="${loginOwner.id }"/></span>
								    <div class="input-group-append">
								      <span class="input-group-text"></span>
								    </div>
								  </div>
								</div>
								<div class="form-group">
								  <label class="label">비밀번호</label>
								  <div class="input-group">
								    <input id="upw1" type="password" class="form-control" placeholder="8글자 이상 입력하세요" name="password" required>
								    <div class="input-group-append">
								      <span class="input-group-text">
								        <svg id="alert-upw1Success" class="bi bi-check" width="1em" height="1em" viewBox="0 0 20 20" fill="green" xmlns="http://www.w3.org/2000/svg">
	                                        <path fill-rule="evenodd" d="M15.854 5.646a.5.5 0 010 .708l-7 7a.5.5 0 01-.708 0l-3.5-3.5a.5.5 0 11.708-.708L8.5 12.293l6.646-6.647a.5.5 0 01.708 0z" clip-rule="evenodd"></path>
	                                    </svg>
	                                    <svg id="alert-upw1Danger" class="bi bi-x" width="1.2em" height="1.2em" viewBox="0 0 20 20" fill="red" xmlns="http://www.w3.org/2000/svg">
	                                        <path fill-rule="evenodd" d="M5.646 5.646a.5.5 0 000 .708l8 8a.5.5 0 00.708-.708l-8-8a.5.5 0 00-.708 0z" clip-rule="evenodd"></path>
	                                        <path fill-rule="evenodd" d="M14.354 5.646a.5.5 0 010 .708l-8 8a.5.5 0 01-.708-.708l8-8a.5.5 0 01.708 0z" clip-rule="evenodd"></path>
	                                    </svg>
								      </span>
								    </div>
								  </div>
								</div>
								<div class="form-group">
								  <label class="label">비밀번호 확인</label>
								  <div class="input-group">
								    <input id="upw2" type="password" class="form-control" placeholder="동일하게 입력하세요" required>
								    <div class="input-group-append">
								      <span class="input-group-text">
								        <svg id="alert-upw2Success" class="bi bi-check" width="1em" height="1em" viewBox="0 0 20 20" fill="green" xmlns="http://www.w3.org/2000/svg">
	                                        <path fill-rule="evenodd" d="M15.854 5.646a.5.5 0 010 .708l-7 7a.5.5 0 01-.708 0l-3.5-3.5a.5.5 0 11.708-.708L8.5 12.293l6.646-6.647a.5.5 0 01.708 0z" clip-rule="evenodd"></path>
	                                    </svg>
	                                    <svg id="alert-upw2Danger" class="bi bi-x" width="1.2em" height="1.2em" viewBox="0 0 20 20" fill="red" xmlns="http://www.w3.org/2000/svg">
	                                        <path fill-rule="evenodd" d="M5.646 5.646a.5.5 0 000 .708l8 8a.5.5 0 00.708-.708l-8-8a.5.5 0 00-.708 0z" clip-rule="evenodd"></path>
	                                        <path fill-rule="evenodd" d="M14.354 5.646a.5.5 0 010 .708l-8 8a.5.5 0 01-.708-.708l8-8a.5.5 0 01.708 0z" clip-rule="evenodd"></path>
	                                    </svg>
								      </span>
								    </div>
								  </div>
								</div>
								<div class="form-group">
								  <button type="button" class="btn btn-primary submit-btn btn-block updateStart">수정하기</button>
								</div>
								<!-- <div class="form-group">
								  <button class="btn btn-block g-login">
								    <img class="mr-3" src="../../../assets/images/file-icons/icon-google.svg" alt="">Log in with Google</button>
								</div> -->
								<div class="text-block text-center my-3">
								  <span class="text-small font-weight-semibold">탈퇴하시겠습니까?</span>
								  <a class="leave" href="javascript:void(0);" class="text-black text-small">탈퇴</a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="modal" id="ownerDeleteModal">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="container">
						<div class="auto-form-wrapper">
							<form id="deleteEnd" action="${path }/owner/ownerDeleteEnd.do" method="post">
								<div class="form-group">
								  <label class="label">가입하실 때 입력한 비밀번호를 한번 더 입력하세요</label>
								  <div class="input-group">
								    <input id="uid" type="hidden" class="form-control" placeholder="abc@email.com" name="id" value="${loginOwner.id }">
								    <input id="upw1" type="password" class="form-control" placeholder="점주 탈퇴시 되돌릴 수 없습니다" name="password" required>
								    <div class="input-group-append">
								      <span class="input-group-text"></span>
								    </div>
								  </div>
								</div>
								<div class="form-group">
								  <button type="button" class="btn btn-primary submit-btn btn-block deleteStart">탈퇴하기</button>
								</div>
								<!-- <div class="form-group">
								  <button class="btn btn-block g-login">
								    <img class="mr-3" src="../../../assets/images/file-icons/icon-google.svg" alt="">Log in with Google</button>
								</div> -->
								<div class="text-block text-center my-3">
								  <span class="text-small font-weight-semibold">수정하기로 돌아가기</span>
								  <a class="updateBack" href="javascript:void(0);" class="text-black text-small">돌아가기</a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="modal" id="productModal">
			<div class="modal-dialog modal-lg modal-dialog-centered">
				<div class="modal-content">
					<div class="container-fluid">
						<div style="height:700px;"></div>						
					</div>
				</div>
			</div>
		</div>
	</c:if>
  </head>
  <body id="top">
    <header>
      <div class="container pt-4">
        <nav class="navbar navbar-expand-lg navbar-dark bg-transparent px-0"><a class="text-white navbar-brand" href="#">머메이드 오더</a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#da-navbarNav" aria-controls="da-navbarNav" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
          <!-- <div class="collapse navbar-collapse text-uppercase" id="da-navbarNav">
            <ul class="navbar-nav ml-auto">
              <li class="nav-item"><a class="nav-link smooth-scroll" href="#">점주 로그인</a></li>
              <li class="nav-item"><a class="nav-link smooth-scroll" href="#services">상품 관리</a></li>
              <li class="nav-item"><a class="nav-link smooth-scroll" href="#projects">매출 조회</a></li>
            </ul>
          </div> -->
          <c:if test="${not empty loginOwner }">
          <div class="cnavbar-nav ml-auto font-weight-norma text-white">
	          <span class=""><c:out value="${loginOwner.id }"/>점주님 환영합니다.</span>
	          <button class="btn btn-link border border-white" type="button" onclick="location.href='${path}/owner/ownerLogout.do'">로그아웃</span>
          </div>
          </c:if>
        </nav>
      </div>
      <div class="da-home-page-text" data-aos="fade-right" data-aos-duration="1000">
        <div class="container">
	        <div class="row w-100">
	          <c:if test="${empty loginOwner }">
		          <div class="col-4 p-1 mx-0">
		            <div class="card mb-3 opacity-5 ownerLoginModal" data-aos="flip-left">
			          <div class="card-body mt-0 mb-0 text-center">
			          	<span class="pb-3 text-primary fa-3x">점주 계정관리</span>
			            <p class="h4 text-primary mt-5 mb-5">점주님이 편하게 관리 할 수 있도록 도와드립니다.</p>
			          </div>
			        </div>
		          </div>
		          <div class="col-4 p-1 mx-0">
		            <div class="card mb-3 opacity-5 manageProduct" data-aos="flip-left">
			          <div class="card-body mt-0 mb-0 text-center">
			          	<span class="pb-3 text-primary fa-3x">상품 관리</span>
			            <p class="h4 text-primary mt-5 mb-5">상품을 등록하거나 수정하고 관리할 수 있습니다</p>
			          </div>
			        </div>
		          </div>
		          <div class="col-4 px-1 mx-0">
		            <div class="card mb-3 opacity-5" data-aos="flip-left">
			          <div class="card-body mt-0 mb-0 text-center">
			          	<span class="pb-3 text-primary fa-3x">매출 확인</span>
			            <p class="h4 text-primary mt-5 mb-5">오늘 매출이 궁금하시다면 여기로</p>
			          </div>
			        </div>
		          </div>
	          </c:if>
	          <c:if test="${not empty loginOwner }">
		          <div class="col-4 p-1 mx-0">
		            <div class="card mb-3 opacity-5 ownerUpdateModal" data-aos="flip-left">
			          <div class="card-body mt-0 mb-0 text-center">
			          	<span class="pb-3 text-primary fa-3x">점주 계정관리</span>
			            <p class="h4 text-primary mt-5 mb-5">점주님이 편하게 관리 할 수 있도록 도와드립니다.</p>
			          </div>
			        </div>
		          </div>
		          <div class="col-4 p-1 mx-0">
		            <div class="card mb-3 opacity-5 manageProduct" data-aos="flip-left">
			          <div class="card-body mt-0 mb-0 text-center">
			          	<span class="pb-3 text-primary fa-3x">상품 관리</span>
			            <p class="h4 text-primary mt-5 mb-5">상품을 등록하거나 수정하고 관리할 수 있습니다</p>
			          </div>
			        </div>
		          </div>
		          <div class="col-4 px-1 mx-0">
		            <div class="card mb-3 opacity-5" data-aos="flip-left">
			          <div class="card-body mt-0 mb-0 text-center">
			          	<span class="pb-3 text-primary fa-3x">매출 확인</span>
			            <p class="h4 text-primary mt-5 mb-5">오늘 매출이 궁금하시다면 여기로</p>
			          </div>
			        </div>
		          </div>
	          
	          </c:if>
	        </div>
        </div>
      </div>
    </header>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <script src="${path }/resources/js/aos.js"></script>
    <script src="${path }/resources/js/ekko-lightbox.min.js"></script>
    <script src="${path }/resources/scripts/main.js"></script>
    <script>
	//경고창 숨기기
    $(function(){
	    document.querySelectorAll(".ownerLoginModal").forEach(item => {
		  item.addEventListener('click', event => {
			$("#loginModal").modal('show');	    
		  });
		});
	    document.querySelectorAll(".manageProduct").forEach(item => {
		  item.addEventListener('click', event => {
			var loginCheck="${not empty loginOwner}";
			if(loginCheck=='true'){
				$("#productModal").modal('show');	    
			} else {
				alert('로그인이 필요합니다');
			}
		  });
		});
	    document.querySelectorAll(".manageSales").forEach(item => {
		  item.addEventListener('click', event => {
			var loginCheck="${not empty loginOwner}";
			if(loginCheck=='true'){
				$("#manageSalesModal").modal('show');	    
			} else {
				alert('로그인이 필요합니다');
			}
		  });
		});
	    document.querySelectorAll(".ownerLoginModal").forEach(item => {
		  item.addEventListener('click', event => {
			$("#loginModal").modal('show');	    
		  });
		});
	    document.querySelectorAll(".ownerUpdateModal").forEach(item => {
		  item.addEventListener('click', event => {
			$("#ownerUpdateModal").modal('show');	    
		  });
		});
	    document.querySelectorAll(".leave").forEach(item => {
		  item.addEventListener('click', event => {
			$("#ownerUpdateModal").modal('hide');	    
			$("#ownerDeleteModal").modal('show');	    
		  });
		});
	    document.querySelectorAll(".updateBack").forEach(item => {
		  item.addEventListener('click', event => {
			$("#ownerDeleteModal").modal('hide');	    
			$("#ownerUpdateModal").modal('show');	    
		  });
		});
	    document.querySelectorAll(".join").forEach(item => {
		  item.addEventListener('click', event => {
			$("#loginModal").modal('hide');	    
			$("#joinModal").modal('show');
		  });
		});
	    document.querySelectorAll(".login").forEach(item => {
		  item.addEventListener('click', event => {
			$("#joinModal").modal('hide');
			$("#loginModal").modal('show');	    
		  });
		});
	    document.querySelectorAll(".joinStart").forEach(item => {
		  item.addEventListener('click', event => {
			  $("#joinEnd").submit();
		  });
		});
	    document.querySelectorAll(".updateStart").forEach(item => {
		  item.addEventListener('click', event => {
			  $("#updateEnd").submit();
		  });
		});
	    document.querySelectorAll(".deleteStart").forEach(item => {
		  item.addEventListener('click', event => {
			  $("#deleteEnd").submit();
		  });
		});
    });
	
	//alert 숨기기
	$("#alert-idSuccess").hide();
	$("#alert-idDanger").hide();
	$("#alert-idDuplicate").hide();
	$("#alert-pw1Success").hide();
	$("#alert-pw1Danger").hide();
	$("#alert-pw2Success").hide();
	$("#alert-pw2Danger").hide();
	$("#alert-upw1Success").hide();
	$("#alert-upw1Danger").hide();
	$("#alert-upw2Success").hide();
	$("#alert-upw2Danger").hide();
    
	var joinFlag=false;
	var joinIdFlag=false;
	var joinPw1Flag=false;
	var joinPw2Flag=false;
	
    function validate(){
		if(joinIdFlag){
			if(joinPw1Flag){
				if(joinPw2Flag){
					console.log('가입 체크완료');
					joinFlag=true;
					return joinFlag;
				} else {
					console.log('비밀번호 불일치');
					return false;
				}
			} else{
				console.log('비밀번호 부정확');
				return false;
			}
		} else {
			console.log('아이디 부정확');
			return false;
		}
    }
    function validate2(){
		if(joinPw1Flag){
			if(joinPw2Flag){
				console.log('가입 체크완료');
				joinFlag=true;
				return joinFlag;
			} else {
				console.log('비밀번호 불일치');
				return false;
			}
		} else{
			console.log('비밀번호 부정확');
			return false;
		}
    }
    
  //아이디 유효값 체크
	$("#id").blur(function(){
	    // userIdCheck : 영문 대.소문자, 숫자 _,-만 입력 가능하고 5에서 20자리를 입력했는지 체크한다 
	    // {}사이에는 n과 m을 입력하여 n과 m사이의 값을 입력했는지 체크한다. n만 입력했을 경우 n자리 수 만큼 입력했는지 체크한다.
		//ajax통신으로 id중복체크
		const ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
		console.log(ctx+'/owner/idDuplicateCheck');
		//console.log($(this).val().trim());
		//var str="";
		
		const id=$(this).val().trim();
		console.log(id);

		$.ajax({
			url:ctx+'/owner/idDuplicateCheck',
			data: {id:id},
			success:function(data) {
				//console.log(data);
				//console.log(data.flag);
				
				str=data.flag;
				
				var userIdCheck = RegExp(/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i);
		        if(!(id=="")){        	
		        	//console.log(str);
		        	//db에 아이디가 있지 않고, 유효성검증 통과
		        	if(!str){
		                 $("#alert-idSuccess").hide();
		                 $("#alert-idDanger").hide();
		                 $("#alert-idDuplicated").show();
		                 console.log('아이디 중복');
		            	joinIdFlag=false;
		            } else if(!userIdCheck.test(id)){  
		                $("#alert-idSuccess").hide();
		                $("#alert-idDanger").show();
		                $("#alert-idDuplicated").hide();
		                console.log('아이디 부적합');
		            	joinIdFlag=false;
		            } else {
		            	$("#alert-idSuccess").show();
		            	$("#alert-idDanger").hide();
		            	$("#alert-idDuplicated").hide();
		            	joinIdFlag=true;
		                console.log('아이디 양호');
		            } 
		        }else{
		            $("#alert-idSuccess").hide();
		            $("#alert-idDanger").hide();
		            $("#alert-idDuplicated").hide();
		            console.log('아이디 미입력');
		        }
			}
		});
	});
  
	$("#pw1").blur(function(){
		var userPwCheck = RegExp(/^[A-Za-z0-9]{6,12}$/);
		const pw1=$(this).val().trim();
        if(!(pw1=="")){        	
			if(!userPwCheck.test(pw1)){  
		        $("#alert-pw1Success").hide();
		        $("#alert-pw1Danger").show();
		    	joinPw1Flag=false;
		        console.log('비밀번호 부적합');
		    } else {
		    	$("#alert-pw1Success").show();
		    	$("#alert-pw1Danger").hide();
		    	joinPw1Flag=true;
		        console.log('비밀번호 양호');
		    }
        } else {
	        $("#alert-pw1Success").hide();
	        $("#alert-pw1Danger").show();
	    	joinPw1Flag=false;
	        console.log('비밀번호 미입력');
        }

	});
	
	$("#pw2").blur(function(){
		const pw1=$("#pw1").val().trim();
		const pw2=$("#pw2").val().trim();
        if(!(pw2==""&&pw1=="")){        	
			if(!pw1==pw2) {
		    	$("#alert-pw2Success").hide();
		    	$("#alert-pw2Danger").show();
		    	joinPw2Flag=false;
		        console.log('비밀번호 불일치');
		    } else {
		    	$("#alert-pw2Danger").hide();
		    	$("#alert-pw2Success").show();
		    	joinPw2Flag=true;
		    	console.log('비밀번호 일치');
		    }
        } else {
	    	$("#alert-pw2Success").hide();
	    	$("#alert-pw2Danger").show();
	    	joinPw2Flag=false;
	        console.log('비밀번호 확인 미입력');
        	
        }
	});
	
	$("#upw1").blur(function(){
		var userPwCheck = RegExp(/^[A-Za-z0-9]{6,12}$/);
		const pw1=$(this).val().trim();
        if(!(pw1=="")){        	
			if(!userPwCheck.test(pw1)){  
		        $("#alert-upw1Success").hide();
		        $("#alert-upw1Danger").show();
		    	joinPw1Flag=false;
		        console.log('비밀번호 부적합');
		    } else {
		    	$("#alert-upw1Success").show();
		    	$("#alert-upw1Danger").hide();
		    	joinPw1Flag=true;
		        console.log('비밀번호 양호');
		    }
        } else {
	        $("#alert-upw1Success").hide();
	        $("#alert-upw1Danger").show();
	    	joinPw1Flag=false;
	        console.log('비밀번호 미입력');
        }

	});
	
	$("#upw2").blur(function(){
		const pw1=$("#upw1").val().trim();
		const pw2=$("#upw2").val().trim();
        if(!(pw2==""&&pw1=="")){        	
			if(!pw1==pw2) {
		    	$("#alert-upw2Success").hide();
		    	$("#alert-upw2Danger").show();
		    	joinPw2Flag=false;
		        console.log('비밀번호 불일치');
		    } else {
		    	$("#alert-upw2Danger").hide();
		    	$("#alert-upw2Success").show();
		    	joinPw2Flag=true;
		    	console.log('비밀번호 일치');
		    }
        } else {
	    	$("#alert-upw2Success").hide();
	    	$("#alert-upw2Danger").show();
	    	joinPw2Flag=false;
	        console.log('비밀번호 확인 미입력');
        	
        }
	});
    </script>
  </body>
</html>