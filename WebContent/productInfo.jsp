<%@page import="product.ProductBean"%>
<%@page import="product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이티팡</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
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
<% 
	int prod_num = Integer.parseInt(request.getParameter("prod_num"));
	ProductDAO dao = new ProductDAO();
	ProductBean bean = dao.selectNumProduct(prod_num);
	String userNickname = dao.selectNickname(bean.getUser_num());
%>
<div class=wrapper>
	<jsp:include page="top.jsp"/>
		<div align="center" style="padding-top:100px;">
			<table width="1000px" height="400px">
				<tr>
					<td width="60%" rowspan="5" align="center"><img class="productImage" src="uploadImage/<%=bean.getImage()%>" width="400px" height="400px"></td>
				</tr>
				
				<tr style="font-family:'jua'; font-size:40px; height:20%;">
					<td><%=bean.getTitle() %></td>
				</tr>
				<tr style="font-family:'jua'; font-size:40px; color:#2dabff; height:15%;">
					<td><%=bean.getPrice() %>원</td>
				</tr>
				<tr style="font-family: 'hanna'; font-size:30px; color:gray; height:15%;">
					<td>판매자 - <%=userNickname%></td>
				</tr>
				<tr height="60%">
					<td>&nbsp;</td>
				</tr>
			</table>
			<br><br>
		<div align="center" style="padding-top:50px; border-top:1px solid #c3c3c3">
			<p><%=bean.getInfo() %></p>
		</div>
		</div>	
	<jsp:include page="bottom.jsp"/>
</div>
</body>
</html>