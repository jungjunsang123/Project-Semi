<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
  <style type="text/css">
   #rating_star_grade a{
	text-decoration: none;
	color: gray;
}
#rating_star_grade a.on{
	color: red;
}
  
  
  </style>
<div class="container">
<div class="addReview-container" align="center">
<form action="${pageContext.request.contextPath}/front" method="post" id="addReview" name="addReviewForm">
<h2>게시글<a href="${pageContext.request.contextPath}/front?command=DetailPost&bbs_no=${requestScope.bvo.bbs_no}">${requestScope.bvo.title}</a>의 후기</h2>
<h4>${requestScope.grvo}님과 함께한 시간을 어땟나요?<br>
다른 사람들을 위해 별점과 후기를 남겨주세요!</h4>
<br>
<input type="hidden" name="command" value="addReview">

<!-- Review Rating area -->
<p id="rating_star_grade">
	<a href="#" >★</a>
	<a href="#" >★</a>
	<a href="#" >★</a>
	<a href="#" >★</a>
	<a href="#" >★</a>
</p>

<script type="text/javascript">
	$("#rating_star_grade a").click(function(){
		$("#star").val($(this).index()+1);
		$(this).parent().children("a").removeClass("on");
		$(this).addClass("on").prevAll("a").addClass("on");
		return false;
	});
</script>
<br>
<!-- Review Rating area Done -->
<textarea cols="70" rows="15" name="review_content" required="required" placeholder="후기를 작성해주세요! &#13;&#10;&#13;&#10;*주의사항*&#13;&#10;후기는 수정이 불가능하니 신중하게 작성해주세요"></textarea>
<input type="hidden" value="" name="reviewstar" id="star">
<div class="btnArea">
<button type="reset" class="btn">리뷰 다시쓰기</button>
<button type="submit" class="btn" onclick="addReview()">리뷰 남기기</button>
</div>
</form>
</div>
</div>
