<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%> 
<script type="text/javascript">
	alert("${requestScope.mvo.name} 님 Seeter에 회원가입이 완료되었습니다.!")
	location.href="front?command=home";
</script>
