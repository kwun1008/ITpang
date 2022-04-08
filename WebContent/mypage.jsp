<%@page import="user.UserDAO"%>
<%@page import="user.UserBean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>아이티팡</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function searchAddress(){
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
            var addr = data.address;
            $("#addr").val(addr);
            $("#addr").focus();
        }
    	}).open();
	}
</script>
<script type="text/javascript">

$(function(){
	var beforeEl;
	$("#menu>ul>li>a").on("mouseover focus",function(){
		beforeEl = $(this);
		if(beforeEl){
			beforeEl.children("img").attr("src",beforeEl.children("img").attr("src").replace("over.png","out.png"));
		}
		$("img",this).attr("src",$("img",this).attr("src").replace("out.png","over.png"));
	});
	$("#menu>ul>li").on("mouseleave",function(){
		
		if(beforeEl){
			beforeEl.children("img").attr("src",beforeEl.children("img").attr("src").replace("over.png","out.png"));
		}
	});
});


</script>
<link href="css/header2.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<div class=wrapper>
		<jsp:include page="top.jsp"/>
		<div class="content_title">
			<div>회원정보 수정</div>
		</div>
		<div class="joinbox">
			<form action="mypagePro.jsp" method="post">
				<div>
					<ul class="join_info">
						<li>아이디</li>
						<li>비밀번호</li>
						<li>비밀번호 확인</li>
						<li>이름</li>
						<li>닉네임</li>
						<li>생년월일</li>
						<li>휴대전화</li>
						<li>이메일</li>
						<li>주소</li>
						<li>&nbsp;</li>
					</ul>
				</div>
				<div>
					<%
						UserDAO dao = new UserDAO();
						String id = (String)session.getAttribute("id");
						UserBean bean = dao.selectUser(id);
						
					%>
						<ul class="join_input">
							<li><input type="text" id="id" class="input" placeholder="아이디" value="<%=bean.getId() %>" disabled>
								<input type="hidden" name="id" value="<%=bean.getId() %>">
							</li>
							
							<li><input type="password" name="pw" class="input" placeholder="비밀번호"></li>
							<li><input type="password" class="input" placeholder="비밀번호 확인"></li>
							<li><input type="text" name="name" class="input" placeholder="이름" value="<%=bean.getName()%>"></li>
							<li><input type="text" name="nickname" class="input" placeholder="닉네임" value="<%=bean.getNickname()%>"></li>
							<li><input type="date" name="birth" class="input" placeholder="생년월일"></li>
							<li><input type="text" name="phone" class="input" placeholder="휴대전화"></li>
							<li><input type="text" name="email" class="input" placeholder="이메일"></li>
							<li><input type="text" name="addr1" id="addr" class="input" placeholder="주소" style="width:300px;"><button type="button" onclick="searchAddress();"  class="check_btn">검색</button></li>
							<li><input type="text" name="addr2" class="input" placeholder="상세주소" style="width:300px;"></li>
						</ul>
				</div>
				<br><br>
				<button type="submit" class="join_btn">수정하기</button>
			</form>
		</div>
		<br><br> 
		<jsp:include page="bottom.jsp"/>
	</div>
</body>
</html>