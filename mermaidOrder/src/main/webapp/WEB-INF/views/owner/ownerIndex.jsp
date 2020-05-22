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
    <link href="${path }/resources/styles/bootstrap.css" rel="stylesheet">
    <link href="${path }/resources/styles/main.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css"/>
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
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="container">
					<button type="button" class="close " data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true" style="font-size:40px;">&times;</span>
			        </button>
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
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="container">
					<button type="button" class="close " data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true" style="font-size:40px;">&times;</span>
			        </button>
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
						<button type="button" class="close " data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true" style="font-size:40px;">&times;</span>
				        </button>
						<div class="auto-form-wrapper">
							<form id="updateEnd" action="${path }/owner/ownerUpdateEnd.do" method="post" onsubmit="return validate2();">
								<div class="form-group">
								  <label class="label">아이디</label>
								  <div class="input-group">
								    <input id="uid" type="text" class="form-control" placeholder="abc@email.com" name="id" value="${loginOwner.id }" disabled>
								    <div class="input-group-append">
								      <span class="input-group-text" style="background-color:#e9ecef;"></span>
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
						<button type="button" class="close " data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true" style="font-size:40px;">&times;</span>
				        </button>
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
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true" style="font-size:65px;">&times;</span>
				        </button>
						<div style="height:750px;">
							<div class="container-fluid h-100">
								<div class="row h-25 justify-content-center align-items-center">
									<div class="col">
										<h1 class="text-center">상품 관리 지원</h1>
									</div>
								</div>
								<div class="row" id="pro-content1" style="height:75%;">
									<div class="col">
										<div class="row h-50 justify-content-center align-items-center">
											<div class="col"></div>
											<div class="col-8 sto-search" style="border:2px solid silver; border-radius:6.5%; cursor:pointer;">
												<div class="row h-50 pt-5 justify-content-center align-items-center">
													<img class="" src="${path }/resources/img/store-search.png" style="width:50px;height:50px;"/>
												</div>
												<div class="row h-50 pt-5 justify-content-center align-items-center">
													<h3>점포 조회</h3>
												</div>
											</div>
											<div class="col"></div>
										</div>
										<div class="row justify-content-center align-items-center">
											<div class="col"></div>
											<div class="col-8 cata-search" style="border:2px solid silver; border-radius:6.5%; cursor:pointer;">
												<div class="row h-50 pt-5 justify-content-center align-items-center">
													<img class="" src="${path }/resources/img/read.png" style="width:50px;height:50px;"/>
												</div>
												<div class="row h-50 pt-5 justify-content-center align-items-center">
													<h3>상품 조회</h3>
												</div>
											</div>
											<div class="col"></div>
										</div>
									</div>								
									<div class="col">
										<div class="row h-50 justify-content-center align-items-center">
											<div class="col"></div>
											<div class="col-8 sto-write" style="border:2px solid silver; border-radius:6.5%; cursor:pointer;">
												<div class="row h-50 pt-5 justify-content-center align-items-center">
													<img class="" src="${path }/resources/img/store-write.png" style="width:50px;height:50px;"/>
												</div>
												<div class="row h-50 pt-5 justify-content-center align-items-center">
													<h3>점포 등록</h3>
												</div>
											</div>
											<div class="col"></div>
										</div>
										<div class="row justify-content-center align-items-center">
											<div class="col"></div>
											<div class="col-8 pro-write" style="border:2px solid silver; border-radius:6.5%;">
												<div class="row h-50 pt-5 justify-content-center align-items-center">
													<img class="" src="${path }/resources/img/write.png" style="width:50px;height:50px;"/>
												</div>
												<div class="row h-50 pt-5 justify-content-center align-items-center">
													<h3>상품 등록</h3>
												</div>
											</div>
											<div class="col"></div>
										</div>
									</div>								
								</div>
								<div class="row h-75" id="pro-content2" style="display:none;">
									<div class="col">
										<div class="row">
											<h3 class="col text-center">상품 정보 조회</h3>
										</div>
										<button class="row align-right btn btn-link border-success pro-return">메인으로</button>
										<div class="row">
											<select class="catalog-category col-6">
												<option selected="selected">--------------------</option>
											</select>
										</div>
										<div class="row mt-2">
											<table class="col table pro-table tbl paginated border text-center">
												<thead>
													<tr>
														<th scope="col">#</th>
														<th scope="col">이미지</th>
														<th scope="col">상품종류</th>
														<th scope="col">상품명</th>
														<th scope="col">가격</th>
														<th scope="col">사이즈</th>
														<th scope="col">핫/아이스</th>
													</tr>
												</thead>
												<tbody>
													<!-- <tr>
														<td colspan="7" class="text-center">현재 등록된 상품이 없습니다</td>
													</tr> -->
												</tbody>
											</table>
										</div>
										<div class="row">
											<div id="pagination-pro" class="col"></div>
										</div>
									</div>
								</div>
								<div class="row h-75" id="pro-content3" style="display:none;">
									<div class="col">
										<div class="row">
											<h3 class="col text-center">점포 정보 조회</h3>
										</div>
										<button class="row align-right btn btn-link border-success pro-return">메인으로</button>
										<div class="row mt-5">
											<table class="col table sto-table tbl paginated border text-center">
												<thead>
													<tr>
														<th scope="col">#</th>
														<th scope="col">점포명</th>
														<th scope="col">점포 종류</th>
														<th scope="col">옵션</th>
													</tr>
												</thead>
												<tbody>
													<!-- <tr>
														<td colspan="4" class="text-center">현재 등록된 점포가 없습니다</td>
													</tr> -->
												</tbody>
											</table>
										</div>
										<div class="row">
											<div id="pagination" class="col"></div>
										</div>
									</div>
								</div>
								<div class="row h-75" id="pro-content4" style="display:none;">
									<div class="col">
										<div class="row">
											<h3 class="col text-center">점포 등록</h3>
										</div>
										<div class="container-fluid">
											<div class="row h-75">
												<div class="col p-5">
													<button class="row align-right btn btn-link border-success pro-return">메인으로</button>
											        <form id="storeFrm">
														<dl class="row border">
					        								<dt class="col-3 input-group">
													        	<label for="storeTitle" class="pl-3 pt-3">등록할 점포명을 입력하세요</label>
														    </dt>
							   							    <dd class="col-9 pt-3 input-group-append">
													            <input type="text" class="form-control" placeholder="점포 상호명" name="storeName" id="storeTitle" required>
												 		        <span class="input-group-text"></span>
							   							    </dd>
					        								<dt class="col-3 input-group">
						        								<div class="input-group">
														        	<label for="storeCategory" class="pl-3 pt-3">점포의 업종을 입력하세요</label>
															    </div>
														   </dt>
							   							    <dd class="col-9 pt-3 input-group-append">
													            <input type="text" class="form-control" placeholder="커피전문점, 카페, 테이크아웃 전문점 등" name="storeType" id="storeCategory" required>
												 		        <span class="input-group-text"></span>
							   							    </dd>
														</dl>
		  									        </form>
												</div>
											</div>
											<div class="row d-flex justify-content-center">
									            <input type="button" id="btnStore" class="btn btn-outline-success col-6" value="저장" >
											</div>
									     </div>
										    <script>
									    		$("#storeTitle").change(function(){
										    		const content=$("[name=storeName]").val();
										    		if(content.trim().length==0){
										    			alert("내용을 입력하세요");
										    		}
									    		});
									    		$("#btnStore").click(function(){
										    		// 반환받은 obj를 JSON 객체로 변환
										    		var jsonObj = $("#storeFrm").serializeObject();
									    			console.log(jsonObj);
									    			console.log(JSON.stringify(jsonObj));
									    			$.ajax({
									    				url:"${path}/store/storeFormEnd.do",
									    				type:'post',
									    				dataType:'json',
									    				async:false,
									    				contentType: 'application/json',
									    				data:JSON.stringify(jsonObj),
									    				success:function(data){
									    					console.log(data);
									    					console.log(data.flag);
									    					if(data.flag){
									    						alert("점포 등록 성공");
									    						location.href="${path}/owner/";
									    					} else {
									    						alert("점포 등록 실패");
									    					}
									    				}
									    			});
									    		});
										    </script>
										</div>
									</div>
								<div class="row h-75" id="pro-content5" style="display:none;">
									<div class="col">
										<div class="row">
											<h3 class="col text-center">점포 수정</h3>
										</div>
										<div class="container-fluid">
											<div class="row h-75">
												<div class="col p-5">
													<button class="row align-right btn btn-link border-success sto-return">목록으로</button>
											        <form id="storeUpdateFrm">
														<dl class="row border">
															<input type="hidden" name="storeNo" value="">
															<input type="hidden" name="ownerNo" value="${loginOwner.ownerNo}">
					        								<dt class="col-3 input-group">
													        	<label for="storeUpdateTitle" class="pl-3 pt-3">수정할 점포명을 입력하세요</label>
														    </dt>
							   							    <dd class="col-9 pt-3 input-group-append">
													            <input type="text" class="form-control" placeholder="" name="storeName" id="storeUpdateTitle" value="" required>
												 		        <span class="input-group-text"></span>
							   							    </dd>
					        								<dt class="col-3 input-group">
						        								<div class="input-group">
														        	<label for="storeUpdateCategory" class="pl-3 pt-3">점포의 카테고리를 입력하세요</label>
															    </div>
														   </dt>
							   							    <dd class="col-9 pt-3 input-group-append">
													            <input type="text" class="form-control" placeholder="" name="storeType" id="storeUpdateCategory" value="" required>
												 		        <span class="input-group-text"></span>
							   							    </dd>
														</dl>
		  									        </form>
												</div>
											</div>
											<div class="row d-flex justify-content-center">
									            <input type="button" id="btnStoreUpdate" class="btn btn-outline-success col-6" value="저장" >
											</div>
									     </div>
										    <script>
										    	$(function(){
										    		jQuery.fn.serializeObject = function() {
										    		    var obj = null;
										    		    try {
										    		        if (this[0].tagName && this[0].tagName.toUpperCase() == "FORM") {
										    		            var arr = this.serializeArray();
										    		            if (arr) {
										    		                obj = {};
										    		                jQuery.each(arr, function() {
										    		                    obj[this.name] = this.value;
										    		                });
										    		            }//if ( arr ) {
										    		        }
										    		    } catch (e) {
										    		        alert(e.message);
										    		    } finally {
										    		    }
										    		 
										    		    return obj;
										    		};
									    		});
									    		$("#storeTitle").change(function(){
										    		const content=$("[name=storeName]").val();
										    		if(content.trim().length==0){
										    			alert("내용을 입력하세요");
										    		}
									    		});
									    		$("#btnStoreUpdate").click(function(){
										    		var jsonObj = $("#storeUpdateFrm").serializeObject();
									    			console.log(jsonObj);
									    			console.log(JSON.stringify(jsonObj));
									    			$.ajax({
									    				url:"${path}/store/storeUpdateFormEnd.do",
									    				type:'post',
									    				dataType:'json',
									    				contentType: 'application/json',
									    				data:JSON.stringify(jsonObj),
									    				success:function(data){
									    					console.log(data);
									    					console.log(data.flag);
									    					if(data.flag){
									    						alert("점포 수정 성공");
									    						location.href="${path}/owner/";
									    					} else {
									    						alert("점포 수정 실패");
									    					}
									    				}
									    			});
									    		});
										    </script>
										</div>
									</div>
								</div>
							</div>
						</div>						
					</div>
				</div>
			</div>
		</div>
		<div class="modal" id="selectSalesModal">
			<div class="modal-dialog modal-lg modal-dialog-centered">
				<div class="modal-content">
					<div class="container-fluid">
						<button type="button" class="close " data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true" style="font-size:65px;">&times;</span>
				        </button>
						<div style="height:750px;"></div>						
					</div>
				</div>
			</div>
		</div>
	</c:if>
  </head>
  <body id="top">
    <header>
      <div class="container pt-4">
        <nav class="navbar navbar-expand-lg navbar-dark bg-transparent px-0"><a class="text-white navbar-brand" href="${path }">머메이드 오더</a>
          <c:if test="${not empty loginOwner }">
          <div class="cnavbar-nav ml-auto font-weight-norma text-white">
	          <span class=""><c:out value="${loginOwner.id }"/> 계정 점주님 환영합니다.</span>
	          <button class="btn btn-link border border-white" type="button" onclick="location.href='${path}/owner/ownerLogout.do'">로그아웃</span>
          </div>
          </c:if>
        </nav>
      </div>
      <div class="da-home-page-text" data-aos="fade-right" data-aos-duration="1000">
        <div class="container">
	        <div class="row w-100">
	          <c:if test="${empty loginOwner }">
		          <div class="col-4 p-1 mx-0" style="cursor:pointer;">
		            <div class="card mb-3 opacity-5 ownerLoginModal" data-aos="flip-left">
			          <div class="card-body mt-0 mb-0 text-center">
			          	<span class="pb-3 text-primary fa-3x">점주 계정관리</span>
			            <p class="h4 text-primary mt-5 mb-5">점주님이 편하게 관리 할 수 있도록 도와드립니다.</p>
			          </div>
			        </div>
		          </div>
	          </c:if>
	          <c:if test="${not empty loginOwner }">
		          <div class="col-4 p-1 mx-0" style="cursor:pointer;">
		            <div class="card mb-3 opacity-5 ownerUpdateModal" data-aos="flip-left">
			          <div class="card-body mt-0 mb-0 text-center">
			          	<span class="pb-3 text-primary fa-3x">점주 계정관리</span>
			            <p class="h4 text-primary mt-5 mb-5">점주님이 편하게 관리 할 수 있도록 도와드립니다.</p>
			          </div>
			        </div>
		          </div>
	          </c:if>
	          <div class="col-4 p-1 mx-0" style="cursor:pointer;">
	            <div class="card mb-3 opacity-5 manageProduct" data-aos="flip-left">
		          <div class="card-body mt-0 mb-0 text-center">
		          	<span class="pb-3 text-primary fa-3x">점포 상품관리</span>
		            <p class="h4 text-primary mt-5 mb-5">점포나 상품을 등록하거나 수정하고 관리할 수 있습니다</p>
		          </div>
		        </div>
	          </div>
	          <div class="col-4 p-1 mx-0" style="cursor:pointer;">
	            <div class="card mb-3 opacity-5 selectSales" data-aos="flip-left">
		          <div class="card-body mt-0 mb-0 text-center">
		          	<span class="pb-3 text-primary fa-3x">매출 확인</span>
		            <p class="h4 text-primary mt-5 mb-5">오늘 매출이 궁금하시다면 여기로</p>
		          </div>
		        </div>
	          </div>
	        </div>
        </div>
      </div>
    </header>
    <script>
    
    
	//경고창 숨기기
    $(function(){ //onload
    	var stoflag=false;
    	var proflag=false;
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
	    
	    //
	    document.querySelectorAll(".cata-search").forEach(item => {
		  item.addEventListener('click', event => {
			var loginCheck="${not empty loginOwner}";
			if(loginCheck=='true'){
				console.log(proflag); //ajax 요청했는지
				
				if(!proflag){
					$("#pro-content1").hide();	    
					
					$.ajax({
						url:"${path}/catalog/catalogSelect.do",
						type:'post',
						dataType:'json',
						contentType:'application/json',
						success:function(data){
							if(data.flag){
								console.log("상품 조회 성공");
								console.log(data.sList);
								let storeList=JSON.parse(data.sList);
								console.log(storeList);
								var dropdown=$(".catalog-category").eq(0);
								for(let i=0; i<storeList.length; i++){
									let option='<option name="storeNo" value='+storeList[i].STORENO+'>';
									option+=""+storeList[i].STORENAME;
									option+="</option>";
									dropdown.append(option);
								}
							} else {
								console.log("상품 조회 실패");
							}
						}
					});
					
					
					$("#pro-content2").show();
					proflag=true;
				} else {
					$("#pro-content1").hide();	    
					$("#pro-content2").show();	    
				}
			} else {
				alert('로그인이 필요합니다');
			}
			
		  });
	    });
	    
	    //점포 검색
	    document.querySelectorAll(".sto-search").forEach(item => {
		  item.addEventListener('click', event => {
			var loginCheck="${not empty loginOwner}";
			if(loginCheck=='true'){
				console.log(stoflag);
				if(!stoflag){
					$("#pro-content1").hide();
					
					$.ajax({
						type:'POST',
	    				url:"${path}/store/storeSelect.do",
	    				dataType:'json',
	    				contentType: 'application/json',
	    				success:function(data){
	    					if(data.flag){
	    						console.log("점포 조회 성공");
	    						console.log(data.storeList);

	    						var result=JSON.parse(data.storeList);
	    						console.log(result);
	    						var tbody=$(".table.sto-table").eq(0).children("tbody");
	    						var html="";
    							html += '<input type="hidden" name="sto-li-ownid" value="${loginOwner.ownerNo}">';
	    						for(let i=0;i<result.length;i++){
	    							html += '<tr>';
	    							html += '<th scope="row" class="stoNo">'+result[i].STORENO+'</th>';
	    							html += '<td class="stoName">'+result[i].STORENAME+'</td>';
	    							html += '<td class="stoType">'+result[i].STORETYPE+'</td>';
	    							html += '<td><button class="btn btn-outline-success mr-4 sto-update">수정</button><button class="btn btn-outline-danger sto-delete">삭제</button></td>';
	    							html += '</tr>';
	    						}
	    						tbody.html(html);
	    						var pgnation=$("#pagination");
	    						pgnation.html(data.pageBar);
								stoflag=true;
	    					} else {
	    						console.log("점포 조회 실패");
	    					}
						}
	    			});
					$("#pro-content3").show();	    
				} else {
					$("#pro-content5").hide();	    
					$("#pro-content4").hide();	    
					$("#pro-content2").hide();	    
					$("#pro-content1").hide();	    
					$("#pro-content3").show();	    
				}
			} else {
				alert('로그인이 필요합니다');
			}
		  });
		});
	    
	    /*modal show*/
	    //점포 개설 모달
	    document.querySelectorAll(".sto-write").forEach(item => {
		  item.addEventListener('click', event => {
			var loginCheck="${not empty loginOwner}";
			if(loginCheck=='true'){
				$("#pro-content1").hide();	    
				$("#pro-content4").show();	    
			} else {
				alert('로그인이 필요합니다');
			}
		  });
		});
	    
	    //상품관리 지원 메인으로 돌아가기
	    document.querySelectorAll(".pro-return").forEach(item => {
		  item.addEventListener('click', event => {
			var loginCheck="${not empty loginOwner}";
			if(loginCheck=='true'){
				$("#pro-content5").hide();	    
				$("#pro-content4").hide();	    
				$("#pro-content3").hide();	    
				$("#pro-content2").hide();	    
				$("#pro-content1").show();
			} else {
				alert('로그인이 필요합니다');
			}
		  });
		});
	    
	    //점포 목록으로 돌아가기
	    document.querySelectorAll(".sto-return").forEach(item => {
		  item.addEventListener('click', event => {
			var loginCheck="${not empty loginOwner}";
			if(loginCheck=='true'){
				$("#pro-content5").hide();	    
				$("#pro-content3").show();	    
			} else {
				alert('로그인이 필요합니다');
			}
		  });
		});
	    
	    //매출 모달
	    document.querySelectorAll(".selectSales").forEach(item => {
		  item.addEventListener('click', event => {
			var loginCheck="${not empty loginOwner}";
			if(loginCheck=='true'){
				$("#selectSalesModal").modal('show');	    
			} else {
				alert('로그인이 필요합니다');
			}
		  });
		});
	    
	    //점주 로그인
	    document.querySelectorAll(".ownerLoginModal").forEach(item => {
		  item.addEventListener('click', event => {
			$("#loginModal").modal('show');	    
		  });
		});
	    
	    //점주 수정 
	    document.querySelectorAll(".ownerUpdateModal").forEach(item => {
		  item.addEventListener('click', event => {
			$("#ownerUpdateModal").modal('show');	    
		  });
		});
	    
	    //점주 탈퇴
	    document.querySelectorAll(".leave").forEach(item => {
		  item.addEventListener('click', event => {
			$("#ownerUpdateModal").modal('hide');	    
			$("#ownerDeleteModal").modal('show');	    
		  });
		});
	    
	    //점주 수정 돌아가기
	    document.querySelectorAll(".updateBack").forEach(item => {
		  item.addEventListener('click', event => {
			$("#ownerDeleteModal").modal('hide');	    
			$("#ownerUpdateModal").modal('show');	    
		  });
		});
	    
	    //점주 가입
	    document.querySelectorAll(".join").forEach(item => {
		  item.addEventListener('click', event => {
			$("#loginModal").modal('hide');	    
			$("#joinModal").modal('show');
		  });
		});
	    
	    //점주 로그인
	    document.querySelectorAll(".login").forEach(item => {
		  item.addEventListener('click', event => {
			$("#joinModal").modal('hide');
			$("#loginModal").modal('show');	    
		  });
		});
	    
	    //점포 수정 메뉴
	    $(document).on('click','.sto-update',function(){
				let storeNo=$(this).parents("tr").find("th.stoNo").text();
				let storeName=$(this).parents("tr").find("td.stoName").text();
				let storeType=$(this).parents("tr").find("td.stoType").text();
				$("#pro-content3").hide();
				$("#pro-content5").find("input[name=storeNo]").val(storeNo);
				$("#pro-content5").find("input[name=storeName]").val(storeName);
				$("#pro-content5").find("input[name=storeType]").val(storeType);
				$("#pro-content5").show();
			}
	    )
	    
	    //점포 삭제 메뉴
	    $(document).on('click','.sto-delete',function(){
			let storeNo=$(this).parents("tr").find("th.stoNo").text();
			let ownerNo=document.querySelector('input[name="sto-li-ownid"]').value;
			console.log(storeNo);
			console.log(ownerNo);
			let stoDelChk=confirm(storeNo+"번 점포를 정말 삭제하시겠습니까?");
			if(stoDelChk){
				$.ajax({
    				url:"${path}/store/storeDeleteEnd.do",
    				type:'post',
    				dataType:'json',
    				contentType: 'application/json',
    				data:JSON.stringify({"storeNo":storeNo,"ownerNo":ownerNo}),
    				success:function(data){
    					console.log(data);
    					console.log(data.flag);
    					if(data.flag){
    						alert("점포 삭제 성공");
    						location.href="${path}/owner/";
    					} else {
    						alert("점포 삭제 실패");
    					}
    				}
    			});
			};
		});

	    /*submit*/
	    
	    //점주 C rud
	    document.querySelectorAll(".joinStart").forEach(item => {
		  item.addEventListener('click', event => {
			  $("#joinEnd").submit();
		  });
		});
	    
	    
	    //점주 cr U d
	    document.querySelectorAll(".updateStart").forEach(item => {
		  item.addEventListener('click', event => {
			  $("#updateEnd").submit();
		  });
		});
	    
	    //점주 cru D
	    document.querySelectorAll(".deleteStart").forEach(item => {
		  item.addEventListener('click', event => {
			  $("#deleteEnd").submit();
		  });
		});
	    
	    
	  //form serializeObject
	    jQuery.fn.serializeObject = function() {
		    var obj = null;
		    try {
		        if (this[0].tagName && this[0].tagName.toUpperCase() == "FORM") {
		            var arr = this.serializeArray();
		            if (arr) {
		                obj = {};
		                jQuery.each(arr, function() {
		                    obj[this.name] = this.value;
		                });
		            }//if ( arr ) {
		        }
		    } catch (e) {
		        alert(e.message);
		    } finally {
		    }
		 
		    return obj;
		};
		
		
		document.querySelectorAll(".catalog-category").forEach(item => 
		{
			item.addEventListener('change',event => 
			{
				$.ajax
				({
					url:"${path}/catalog/catalogStore.do",
    				type:'post',
    				dataType:'json',
    				contentType: 'application/json',
    				data:JSON.stringify({"storeNo":storeNo}),
    				success:function(data)
    				{
    					
    				}
				});
			};
		});
	    
    }); //onload end
	
    
    // non-onload
       
    
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
	
	//점주 가입 유효성 1 - 아이디, 비밀번호 체크
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
	
	//점주 수정 유효성 - 비밀번호만 체크
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
	$("#id").change(function(){
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
  
  //비밀번호 유효성
	$("#pw1").change(function(){
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
	//비밀번호 일치
	$("#pw2").change(function(){
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
	
	//수정 비밀번호 유효성
	$("#upw1").change(function(){
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
	
	//수정 비밀번호 일치
	$("#upw2").change(function(){
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