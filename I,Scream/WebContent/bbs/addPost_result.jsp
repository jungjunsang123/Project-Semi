<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>     

<script type="text/javascript">
alert("게시물 등록완료하였습니다.");
location.href="${pageContext.request.contextPath}/front?command=getPostList";
</script>