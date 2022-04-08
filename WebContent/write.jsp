<%@page import="jdk.internal.org.objectweb.asm.commons.ModuleTargetAttribute"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>아이티팡</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	function readURL(url){
		if(url.files && url.files[0]){
			var reader = new FileReader();
			reader.readAsDataURL(url.files[0]);
			reader.onload = function(ProgressEvent){ 
				$("#preview").attr("src", ProgressEvent.target.result);
			}
			
		}
	}
	function fn_submit(){
		var file = document.getElementById("file").files[0]
		var fileType = file.type;
		var typeCheck = fileType.substring(0,5);
		if(typeCheck == "image"){
			form.submit();
		}else{
			alert("이미지 형식의 파일이 아닙니다.");
			$("#file").focus();
			return false;
		}
	}
</script>
<link href="css/header2.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<div class=wrapper>
		<jsp:include page="top.jsp"/>
			<div class="content_title">
				<div>상품 등록</div>
			</div>
			<div class="writebox">	
				<form action="upload.jsp" method="post" enctype="multipart/form-data" id="form">
					<div>
						<div class="preview" style="width:240px; height:240px; text-align:center; display:inline-block; border:1px solid #c3c3c3;">
							<div style="width:200px; height:200px; display:inline-block; margin:20px; 20px;">
								<img id="preview" src="#" style="max-width:200px; max-height:200px; width:100%; height:100%;">
							</div>
						</div>
					</div>
					<div class="write_info">
						<ul>
							<li>카테고리</li>
							<li>상품명</li>
							<li>가격(원)</li>
							<li id="info">상품 설명</li>
							<li>이미지</li>
						</ul>
					</div>
					<div class="write_input">
						<ul>
							<li><input type="hidden" name="id" value="<%=session.getAttribute("id")%>"></li>
							<li>
								<select name="category" >
									<option value="식품">식품</option>
									<option value="의류">의류</option>
									<option value="생활용품">생활용품</option>
									<option value="도서">도서</option>
									<option value="뷰티">뷰티</option>
								</select>
							</li>
							<li><input type="text" class="input" name="title" placeholder="상품명"></li>
							<li><input type="text" class="input" name="price" placeholder="가격"></li>
							<li><textarea name="info" rows="12" cols="40"></textarea></li>
							<li><input type="file"name="upFile" id="file" onchange="readURL(this);"></li>
						</ul>	
					</div>
					<br><br>
					<button type="button" class="join_btn" onclick="fn_submit();">등록하기</button>
				</form>
			</div>
			<jsp:include page="bottom.jsp"/>
	</div>
		
</body>
</html>