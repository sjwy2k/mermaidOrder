<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<div class="container-fluid section">
	<div class="row h100 pt-5 value-proposition" id="first">
		<div class="col-12" style="height:150px;"></div>
		<div class="col-12">
			<div class="row">
				<h1 class="col text-center font-weight-bold">머메이드커피</h1>
			</div>
			<div class="row">
				<div class="col-4"></div>				
				<img class="col-4" src="${path}/mermaid/resources/img/coffee.jpg" style="width:100%;object-fit:cover;height:300px;">
				<div class="col-4"></div>				
			</div>
			<div class="row">
				<span class="col mt-5 text-center">맛있는 커피를 마시고 싶으신가요? <br><br> 카페를 관리하고 싶으신가요? <br><br> 편리하게 주문하도록 도와주는 인어주문! 많은 이용 바랍니다.</span>
			</div>
		</div>
	</div>
	<div class="row h100 value-proposition" id="second">
		<div class="col-12"></div>
		<div class="col-12">
			<div class="row">
				<h3 class="col text-center font-weight-bold">빠르고 편하게 주문하세요</h3>
			</div>
			<div class="row mt-5">
				<h1 class="col text-center font-weight-bold">맛있는 커피가 기다립니다.</h1>
			</div>
			<div class="row">
				<span class="col mt-5 text-center">풍미 좋은 커피와 하루를 함께하세요.<br><br>머메이드오더가 편한 주문을 도와드리겠습니다</span>
			</div>
			<div class="row mt-5">
				<div class="col-4"></div>
				<img class="col-4 order" src="${path}/mermaid/resources/img/orderButton.png" style="cursor:pointer;" onclick="javascript:order();">
				<div class="col-4"></div>
			</div>
		</div>
	</div>
	<div class="row h100 value-proposition" id="third">
		<div class="col-12"></div>
		<div class="col-12">
			<div class="row"></div>
			<div class="row">
				<h3 class="col text-center font-weight-bold">매출이 궁금하신가요?</h3>
			</div>
			<div class="row mt-5">
				<h1 class="col text-center font-weight-bold">점주 가입을 환영합니다</h1>
			</div>
			<div class="row">
				<span class="col mt-5 text-center">편하고 정확하게 매장을 운영하세요.<br><br>머메이드오더의 점주 관리 서비스!<br><br>카페 관리 서비스로 접속하시려면 여기로</span>
			</div>
			<div class="row mt-5">
				<div class="col-4"></div>
				<img class="col-4 join" src="${path}/mermaid/resources/img/joinButton.png" style="cursor:pointer;" onclick="location.href='${path}/mermaid/owner';">
				<div class="col-4"></div>
			</div>
		</div>
	</div>
	<script src="${path}/mermaid/resources/js/jquery.scrollTo.js"></script>
	<script>
		$(function(){
	        $('.nav-item> .tab').click(function(e){
	          $.scrollTo(this.hash || 0, 500);
	          e.preventDefault();
	        });
	      });
		function order(){
			var phone=prompt("고객님의 전화번호를 입력해 주세요", "하이픈'-' 없이 입력해주세요 예)01012345678");
			if(phone.length>9&&!isEmpty(phone)){
				location.href='${path}/mermaid/owner?phone='+phone;
			} else {
				alert('올바른 전화번호를 입력해 주세요');
			}
		}
	</script>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>