<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>     

<table class="table table-bordered">
	<tr>
		<td>작성자</td>
		<td>별점</td>
		<td>작성일</td>
	</tr>
	<tr>
		<td>${requestScope.rvo.vo.id}</td>
		<td>${requestScope.rvo.stars }</td>
		<td>${requestScope.rvo.createDate }</td>
	</tr>
	<tr>
		<td colspan="3">
			<pre>${requestScope.rvo.review_context }</pre>
		</td>
	</tr>
</table>
