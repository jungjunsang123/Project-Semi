<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>     
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/myhome.css" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>회원정보수정</title>
</head>
<body>

<script type="text/javascript">
	$(document).ready(function(){
		var checkPw="";
		var pw1;
		var pw2;
	
		$("#pw1").keyup(function(){
			checkPw="";
			var pwValue=$(this).val();
			pw1=$("#pw1").val();
			pw2=$("#pw2").val();
			if(pwValue.length<7||pwValue.length>18){
				$("#passwordLengthCheckMessage").html("비밀번호는 7자 이상 18자 이하만 가능합니다.").css("color","red");
				return;
			}else{
				//alert(pw1+" "+pw2);
				$("#passwordLengthCheckMessage").html("사용 가능한 비밀번호 입니다.").css("color","blue");
			}
		}); //pw1 length keyup 기능 end
		
		$("#pw2").keyup(function(){
			pw1=$("#pw1").val();
			pw2=$("#pw2").val();
			if($("#passwordLengthCheckMessage").text()=='사용 가능한 비밀번호 입니다.'){
				if(pw1 != pw2){
					$("#passwordCheckMessage").html("비밀번호가 일치하지 않습니다.").css("color","red");
				}else{
					$("#passwordCheckMessage").html("사용 가능한 비밀번호 입니다.").css("color","blue");
					
				}
			}	
		}) //비밀번호와 비밀번호 확인을 위한 pw2 keyup 기능 end
		
		 var teltype;
		$("#teltype").keyup(function(){
			var telValue=$(this).val();
			teltype=$("#teltype").val();
			if(telValue.length != 11){
				$("#telInputTypeCheck").html("잘못된 번호 형식입니다.").css("color","red");
				return
			}else{
				$("#telInputTypeCheck").html(" ");
			}
		});//휴대폰번호 등록 제한
		
		$("#memberInfoUpdate").click(function(){
			pw1=$("#pw1").val();
			pw2=$("#pw2").val();
			teltype=$("#teltype").val();
			if(pw1 != pw2){
				alert("비밀번호를  확인해주세요!");
				return false;
			
			}else if(teltype.length!=11){
				alert("휴대폰 번호를 확인해주세요!");
				return false;
			}else{
				if(confirm("수정하시겠습니까?")){
					$("#registerForm").submit();
					return true;
				}
				
			}
		}); //registerForm 기능 end
		//이미지 업로드
		$("#profileImg").on("change", function() {
			var formData = new FormData($("#profileUploadForm")[0]);
			$.ajax({
				type:"post",
				enctype: 'multipart/form-data',
				url:"profileImg",
		        dataType: "text",
		        data: formData,
		        processData: false, // Jquery 내부적으로 query string 방식으로 사용을 안할 때 사용 : 파일 전송때는 사용 안함 - 필수
		        contentType: false, // multipart/form-data 방식으로 하기 위해 설정 - 필수
				success:function(data){
					if (data == 'IsNotLogin') {
						alert("로그인부탁드립니다.");
						location.href="front?command=home";
		            }
					else{
						alert("dd");
					  //$("#profileUploadForm")[0].reset();
	                  $(".DivProfileImg img").attr("src","${pageContext.request.contextPath}/profile/"+data);
					}
				}
			});
		})
	});

</script>
<div id="signinCss">
<font size= "4px">
<form action="${pageContext.request.contextPath}/front" method="post" id="registerForm">
		<input type="hidden" name="command" value="memberUpdate"><br>
				<h1 align="center"><a href="${pageContext.request.contextPath }/front?command=home">
				<img src="css/Seeter_logo_wo_background.png" width="200" height="100"></a></h1><br>
			
			<b>아이디</b><br>
			<input type="text" value="${requestScope.fmvo.id}" readonly><br>
			<span id="checkResult"></span><br>
			<b>비밀번호</b><br>
			<input type="password" name="password" id="pw1" required="required"><br>
			<span id="passwordLengthCheckMessage"></span><br>
			<b>비밀번호확인</b><br>
			<input type="password" name="passwordconfirm" id="pw2"required="required"><br>
			<span id="passwordCheckMessage"></span><br>
			<b>이름</b><br>
			<input type="text" name="name" required="required" value="${requestScope.fmvo.name}"><br><br>
			<b>주소</b><br>
			<input type="text" name="address" required="required" value="${requestScope.fmvo.address}"><br><br>
			<b>전화번호</b><br>
			<input type="text" pattern="[0-9]+" name="tel" id="teltype" placeholder="번호만 입력하세요. ex)01012345678 " value="${requestScope.fmvo.tel}" required="required"><br>
			<span id="telInputTypeCheck"></span><br>
			<b>성별</b><br>
			<select name="sex" class="sexSelect">
			<c:choose>	
				<c:when test="${requestScope.fmvo.sex eq'남자'}">
					 <option value="남자" selected="selected">남자</option>
				 	 <option value="여자">여자</option>
				 	 <option value="선택하지않음">선택하지않음</option>
				</c:when>
				<c:when test="${requestScope.fmvo.sex eq'여자'}">
					 <option value="남자">남자</option>
				  	<option value="여자" selected="selected">여자</option>
				  	<option value="선택하지않음">선택하지않음</option>
				</c:when>
				<c:when test="${requestScope.fmvo.sex eq '선택하지않음'}">
					  <option value="남자" >남자</option>
				  	  <option value="여자">여자</option>
				      <option value="선택하지않음" selected="selected">선택하지않음</option>
				</c:when>
				<c:otherwise>
					  <option value="남자" >남자</option>
				  	  <option value="여자">여자</option>
				      <option value="선택하지않음">선택하지않음</option>
					
				</c:otherwise>
			</c:choose>
			</select><br><br>
			<b>생년월일</b><br>
			<input type="date" name="birth" id="birth" value="${requestScope.fmvo.birth}"><br><br>
	</form> 
            <b>프로필</b><br>
              <div class="DivProfileImg">
              	<c:choose>
              		<c:when test="${requestScope.fmvo.profile_path != null }">
              			<img src="${pageContext.request.contextPath}/profile/${requestScope.fmvo.profile_path}"style="width:460px; heigth:100%;object-fit:contain"/>
              		</c:when>
              		<c:otherwise>
              			<img src="${pageContext.request.contextPath}/profile/defaultProfile.jpg" style="width:460px; heigth:100%;object-fit:contain"/>
              		</c:otherwise>
              	</c:choose>
			 </div>
				<form id="profileUploadForm" enctype="multipart/form-data">
					<input type="file" name="profileImg" id="profileImg" accept="image/*"><br><br>
				</form>
				<div style="text-align: center">
					<button type="button" class="btn" id="memberInfoUpdate" >회원정보수정</button><br><br>
				</div>	
		</font>
		</div>
		
<!-- footer -->
<div id="signinfooterCsds">
<a href="${pageContext.request.contextPath }/front?command=home"><img src="css/Seeter_logo_wo_background.png" width="100" height="50"></a>&nbsp;&nbsp;For you. Seeter.
<br><br><br><br>
</div>

</body>
</html>

