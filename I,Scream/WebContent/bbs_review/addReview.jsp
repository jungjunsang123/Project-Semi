<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>     
    
<div class="addReview-container" align="center">
<form action="${pageContext.request.contextPath}/front" method="post" id="addReview">
<h3>**후기받는대상**님과 함께한 시간을 어땟나요?<br>
다른 사람들을 위해 별점과 후기를 남겨주세요!</h3>
<br>
<input type="hidden" name="command" value="addReview">
<!-- Review Rating area -->
<p id="rating_star_grade">
	<a href="#">★</a>
	<a href="#">★</a>
	<a href="#">★</a>
	<a href="#">★</a>
	<a href="#">★</a>
</p>

<script type="text/javascript">
	$("#rating_star_grade a").click(function(){
		$(this).parent().children("a").removeClass("on");
		$(this).addClass("on").prevAll("a").addClass("on");
		return false;
	});
</script>
<br>
<!-- Review Rating area Done -->
<textarea cols="70" rows="15" name="review_content" required="required" placeholder="후기를 작성해주세요!"></textarea>
<div class="btnArea">
<button type="reset" class="btn">리뷰 다시쓰기</button>
<button type="submit" class="btn">리뷰 남기기</button>
</div>
</form>
</div>
