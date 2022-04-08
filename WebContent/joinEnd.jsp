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

  <script>
    $(document).ready(function(){
      $('.slider').bxSlider({
    	  	auto: true,
    	  	mode: 'fade',
    	    captions: true,
    	    pager:false
      });
    });
  </script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
				<div>회원가입 완료</div>
				<br><button type="button" onclick="location.href='index.jsp'" class="join_btn">메인으로</button>
				<br><br> 
			</div>
			<jsp:include page="bottom.jsp"/>
	</div>
		
</body>
</html>