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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/myhome.css" />
<link href="https://fonts.googleapis.com/css?family=https://fonts.googleapis.com/css?family=Inconsolata:400,500,600,700|Raleway:400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function Recruit() {
		if (confirm("채용하시겠습니까?")) {
			 document.recruitForm.submit();
		}
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
			document.getElementById("addPost").submit();
		}
	}
	function postBack(){
		location.href="front?command=getPostList";
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