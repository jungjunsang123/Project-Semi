<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/myhome.css"/>
<link href="https://fonts.googleapis.com/css?family=https://fonts.googleapis.com/css?family=Inconsolata:400,500,600,700|Raleway:400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
<meta charset="UTF-8">
<title>아이스크림 마이페이지</title>
<script type="text/javascript">
	$(document).ready(function(){
		$("#Recruit").click(function(){
			if(confirm($("#applyID").val()+"를 채용하시겠습니까?")){
				$.ajax({	
					type: "post",
					url: "front",
					data: "command=Recruit&bbs_no="+$("#bbs_no").val()+"&applyID="+$("#applyID").val(),
					success:function(result){ // result변수로 응답정보가 전달된다.
						if(result=="OK"){
							alert("채용됐습니다.");
							$("#Recruit").text("채용완료")
						}
						else{
							alert("로그인부탁드립니다.");
							location.href="front?command=home";
						}
					}
				})//ajax
			}
		})
	})
		function deletePost() {
		if (confirm("게시글을 삭제하시겠습니까?")) {
			 document.deletePostForm.submit();
		}
	}
		function updatePost() {
			if (confirm("게시글을 수정하시겠습니까?")) {
				document.getElementById("updatePostSubmit").submit();
			}
		}
		
		function updatePostForm() {
			document.updateForm.submit();
	}
		function postBack(){
			location.href="front?command=mypage";
		}
		Kakao.init('9f024aef4fd406c17cf1d1f36dfd1c54');
		//카카오 로그인 버튼을 생성한다.
		function loginWithKakao(){
			Kakao.Auth.loginForm({
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
				}//success
			})
		}
		function logoutWithKakao(){
			Kakao.Auth.logout(function() { location.href="${pageContext.request.contextPath}/front?command=kakaoLogout"}); 
		}

</script>
</head>
<body>
<div class="container">
	<c:import url="bbs-header.jsp"/>
	<hr>   
		<div class="row content">
				<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="card">
				<div class="card-header">
					<div class="col-sm-3">
						<c:choose>
							<c:when test="${sessionScope.mvo.profile_path!=NULL}">
								<img src="${pageContext.request.contextPath}/profile/${sessionScope.mvo.id}/${sessionScope.mvo.profile_path}" class="card-img-top" style="height: 245px;width: 245px;">
							</c:when>
							<c:otherwise>
								<img class="card-img-top" src="profile/defaultProfile.jpg" style="width: 245px; height:245.5px;">
							</c:otherwise>
						</c:choose>
					</div>
					<div class="col-sm-9">
						<h1>${sessionScope.mvo.name}님의
							<br>현재 평균별점은 ${sessionScope.mvo.star}점 입니다!
						</h1>
					</div>
				</div>
				<div class="card-body">
					<div class="col-sm-12">
						<div class="row" id="navRow">
							<div class="container">
								<br>
								<!-- Nav tabs -->
								<ul class="nav nav-tabs" role="tablist">
									<li class="nav-item">
										<a class="nav-link" href="${pageContext.request.contextPath}/front?command=mypage">개인정보</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="${pageContext.request.contextPath}/front?command=findPostListById">지원현황</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="${pageContext.request.contextPath}/front?command=findApplyList">지원한목록</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="${pageContext.request.contextPath}/front?command=ReviewList">후기리스트</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="${pageContext.request.contextPath}/front?command=scrapList">마이스크랩</a>
									</li>
								</ul>
								<br><br>
								<!-- Tab panes -->
								
								<div class="tab-content">
									<c:import url="${requestScope.url}"></c:import>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
		</div>
	
	<hr>
	<c:import url="footer.jsp"/>
</div>

</body>
</html>