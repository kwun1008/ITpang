<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>아이티팡</title>title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script type="text/javascript">
$(function(){
	var beforeEl;
	$("#menu>ul>li>a").on("mouseover focus",function(){
		beforeEl = $(this);
		if(beforeEl){
			beforeEl.children("img").attr("src",beforeEl.children("img").attr("src").replace("over.png","out.png"));
		}
		$(".menu>ul>li>ul:visible").slideUp("fast");
		$(this).next().stop().slideDown("normal");
		$("img",this).attr("src",$("img",this).attr("src").replace("out.png","over.png"));
	});
	$("#menu>ul>li").on("mouseleave",function(){
		
		$(".menu ul>li>ul:visible").slideUp("fast");
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
			<div>로그인</div>
		</div>
		<div class="joinbox">
			<form action="loginPro.jsp" method="post">
				<div>
					<ul class="join_info">
						<li>아이디</li>
						<li>비밀번호</li>
					</ul>
				</div>
				<div>
						<ul class="join_input">
							<li><input type="text" name="id" id="id" class="input" placeholder="아이디"></li>
							<li><input type="password" name="pw" class="input" placeholder="비밀번호"></li>
						</ul>
				</div>
				<br><br>
				<button type="submit" class="join_btn">로그인</button>
			</form>
		</div>
		<br><br> 
		<jsp:include page="bottom.jsp"/>
	</div>
</body>
</html>