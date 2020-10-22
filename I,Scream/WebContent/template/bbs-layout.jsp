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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/myhome.css" />
<link href="https://fonts.googleapis.com/css?family=https://fonts.googleapis.com/css?family=Inconsolata:400,500,600,700|Raleway:400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function(){
		let today = new Date();   
		let year = today.getFullYear(); // 년도
		let month = today.getMonth() + 1;  // 월
		let date = today.getDate();  // 날짜
		alert(year+"-"+month+"-"+date)
		$("#startWorkTimeInput").attr("value",year+"-"+month+"-"+date);
		
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
	Kakao.init('9f024aef4fd406c17cf1d1f36dfd1c54');
//카카오 로그인 버튼을 생성한다.
function loginWithKakao(){
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
		}//success
	})
}
function logoutWithKakao(){
	Kakao.Auth.logout(function() { location.href="${pageContext.request.contextPath}/front?command=kakaoLogout"}); 
}
	function deletePost() {
		if (confirm("게시글을 삭제하시겠습니까?")) {
			 document.deletePostForm.submit();
		}
	}
	function updatePost() {
		if (confirm("게시글을 수정하시겠습니까?")) {
			document.getElementById("updatePost").submit();
		}
	}
	function updatePostForm() {
			document.updateForm.submit();
	}
	function addPost() {
		if (confirm("게시글을 등록하시겠습니까?")) {
			document.addPostForm.submit();
		}
	}
	function postBack(){
		location.href="front?command=getPostList";
	}
	function apply(){
		if(confirm("${requestScope.pvo.vo.id}에게 지원하시겠습니까?")){
			alert("지원을 보냈습니다");
			document.applyForm.submit();
		}
	}
	function goHome(){
		location.href="front?command=home";
	}
</script>
</head>
<body>
<div class="container">
	<c:import url="bbs-header.jsp"/>
	<hr>   
		<div class="row content content-custom">
				<c:import url="${requestScope.url}"></c:import>
		</div>
	<hr>   
	<c:import url="footer.jsp"/>
</div>

</body>
</html>