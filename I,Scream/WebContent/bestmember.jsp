<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#ajaxBtn").click(function() {
		var abc=$(this).val();
		//alert(abc);
		 $.ajax({
			type:"post",
			url:"front",
			data:"command=bestemployee",
			success:function(result){
				alert(result);
			}
		}); 
	});
});

</script>
</head>
<body>
<input type="button" id="ajaxBtn" value="">멤버 들의 평균 점수 보러가기

</body>
</html>