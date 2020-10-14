<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>     
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">

<table>
<tr>
<td>${requestScope.pvo.bbs_no}</td>
</tr>
<tr>
<td>${requestScope.pvo.hits}</td>
</tr>
<tr>
<td>${requestScope.pvo.vo.id}</td>
</tr>
</table>

<a href="${pageContext.request.contextPath}/front?command=home">
홈으로 돌아가기
</a>
</div>
</body>
</html>