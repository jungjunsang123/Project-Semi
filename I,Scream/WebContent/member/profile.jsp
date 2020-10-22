<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
	<div class="col-md-12">
		<div class="card">
			<div class="card-header">
				<div class="col-sm-12">
					<h1>회원 프로필</h1>
				</div>
			</div>
			<div class="card-body">
				<div class="col-sm-12">
					<div class="row">
						<div class="col-sm-2">
							<img src="image/img_avatar1.png" class="img-thumbnail"
								alt="Cinque Terre" width="200" height="200">
						</div>
						<div class="col-sm-5">
							<h1>${requestScope.mvo.name}님의
								<br>현재 평균별점은 ${requestScope.mvo.star}점 입니다!
							</h1>
						</div>
						<div class="col-sm-5">
							<form class="form-horizontal" role="form">
								<div class="form-group row">
									<label for="name" class="col-sm-3 control-label">이름</label>
									<div class="col-sm-9" style="text-align: left">
										<label class=" control-label">${requestScope.mvo.name}</label>
									</div>
								</div>
								<div class="form-group row">
									<label for="address" class="col-sm-3 control-label">주소</label>
									<div class="col-sm-9" style="text-align: left">
										<label class=" control-label">${requestScope.mvo.address}</label>
									</div>
								</div>
								<div class="form-group row">
									<label for="birthDate" class="col-sm-3 control-label">생년월일</label>
									<div class="col-sm-9">
										<label class=" control-label">${requestScope.mvo.birth}</label>
									</div>
								</div>
								<div class="form-group row">
									<label for="sex" class="col-sm-3 control-label">성별</label>
									<div class="col-sm-9">
										<label class=" control-label">${requestScope.mvo.sex}</label>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-sm-offset-11 col-sm-1">
		<br>
		<table>
			<tr>
				<td colspan=1 class="btnArea" style="text-align: right;">
					<button type="button" class="btn btn-secondary"
						onclick="goHome()">뒤로</button>
				</td>
			</tr>
		</table>
	</div>
</div>
