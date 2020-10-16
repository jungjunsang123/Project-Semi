<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>     

<script type="text/javascript">
alert("${requestScope.id} 님을 채용하였습니다.");
location.href="${pageContext.request.contextPath}/front?command=DetailPost&&bbs_no=${requestScope.bbs_no} ";
</script>