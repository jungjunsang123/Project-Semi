<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
	Kakao.init('9f024aef4fd406c17cf1d1f36dfd1c54');
	//카카오 로그인 버튼을 생성한다.
	function loginWithKakao() {
		Kakao.Auth.login({
			success : function(authObj) {
				Kakao.API.request({
					url : '/v2/user/me',
					success : function(res) {
						var email = res.kakao_account.email;
						var name = res.properties.nickname;
						var image = res.properties.profile_image;
						$.ajax({	
						type: "post",
						url: "front",
						data: "command=kakaoLogin&id="+email+"&name="+name,
						success:function(result){ // result변수로 응답정보가 전달된다.
							if(result!="NULL"){
								alert(result+"님 카카오 계정으로 로그인 됐습니다.");
								location.href="${pageContext.request.contextPath}/front?command=home"
							}					
						}
					})//ajax
					}
				})
			}
		})
	}
</script>

<div style="margin-right: 3px;">
	<c:choose>
		<c:when test="${sessionScope.mvo==null}">
			<a href="${pageContext.request.contextPath}/front?command=registerForm">회원가입</a>
			
			<form method="post" action="${pageContext.request.contextPath}/front">
				<input type="hidden" name="command" value="login">
				<fieldset class="login_form">
					<div class="id_area">
						<span class="input_box"> <input type="text" name="id"
							placeholder="아이디" required="required" width=41px;>
						</span>
					</div>
					<div class="password_form">
						<span class="input box"> <input type="password"
							name="password" placeholder="비밀번호" required="required">
						</span>
					</div>
					<input type="submit" value="로그인">
					<a href="javascript:loginWithKakao()"> 
						<img src="${pageContext.request.contextPath}/css/kakao_login_small.png">
					</a>
				</fieldset>
<%-- <<<<<<< HEAD
	</form>
	</c:when>
	<c:otherwise>
		${sessionScope.mvo.name} 님 로그인 상태<br>
		<a href="${pageContext.request.contextPath}/front?command=ReviewList">마이페이지</a><br>
		<a href="${pageContext.request.contextPath}/front?command=listApplyer&bbs_no=5">지원 현황</a><br>
		<a href="${pageContext.request.contextPath}/front?command=findApplyList">지원 목록</a><br>
		<a href="${pageContext.request.contextPath}/front?command=memberUpdateForm">회원정보수정(test)</a><br>
		<a href="${pageContext.request.contextPath}/front?command=logout">로그아웃</a><br>
	</c:otherwise>
=======--%>
			</form>
		</c:when>
		<c:otherwise>
		${sessionScope.mvo.name} 님 로그인 상태<br>
			<a href="${pageContext.request.contextPath}/front?command=logout">로그아웃</a>
			<br>
			<a
				href="${pageContext.request.contextPath}/front?command=listApplyer&bbs_no=5">게시물
				지원한 사람출력</a>
			<br>
			<a
				href="${pageContext.request.contextPath}/front?command=findApplyList">지원현황
				클릭시 리스트 출력</a>
			<br>
			<a
				href="${pageContext.request.contextPath}/front?command=memberUpdateForm">회원정보수정(test)</a>
			<br>
			<a
				href="${pageContext.request.contextPath}/front?command=findPostListById&id=${sessionScope.mvo.id}">내가
				작성한 게시물 </a>
			<br>
		</c:otherwise>
<%-- >>>>>>> branch 'main' of https://github.com/Minikanko/Kosta-semiProject-i-Scream.git --%>
	</c:choose>
</div>
