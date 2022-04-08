<%@page import="java.text.SimpleDateFormat"%>
<%@page import="product.ProductDAO"%>
<%@page import="product.ProductBean"%>
<%@page import="java.util.ArrayList"%>
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
<%
	/*String pageN = request.getParameter("page");
	try{
		if(pageN.isEmpty()){
			pageN = "1";
		}
	}catch(Exception e){
		pageN = "1";
	}
	int pageNum = Integer.parseInt(pageN);
	int pageSize = 12;
	int index = (pageNum-1)*pageSize;
	String category = request.getParameter("category");
	int maxProduct = dao.maxProduct();
	int maxPage = dao.maxPage(pageSize);
	int cMaxProduct = dao.categoryMaxProduct(category);
	int cMaxPage = dao.categoryMaxPage(pageNum, category);
	String search_text = request.getParameter("search");
	int sMaxProduct = dao
	
	
	
	
	if(category==null || category.length()==0){
		list = dao.selectProduct(index, pageSize);	
	}
	else{
		list = dao.categoryProduct(index, pageSize, category);
	}*/
	
	ArrayList<ProductBean> list = new ArrayList<ProductBean>();
	ProductDAO dao = new ProductDAO();
	String category = request.getParameter("category");
	String search = request.getParameter("search");
	
	list = dao.selectProduct(category, search);
	


%>
<body>
	<div class=wrapper>
		<jsp:include page="top.jsp"/>
		<div class="slider">
    			<div><img src="images/timesale3.png"></div>
    			<div><img src="images/timesale2.png"></div>
    			<div><img src="images/timesale1.png"></div>
    			<div><img src="images/timesale4.png"></div>
  		</div>
  		<div class=content_title>
  		
  			<div>
  				<%if(category==null || category.length()==0){%>
  					전체 상품
  				<%}else{%>
  					<%=category%>
  				<%}%>
  			</div>
		</div>
  		<div class="content">
  			<ul>
  				<%
  				for(int i=0;i<list.size();i++){
  					ProductBean bean = list.get(i);
  				%>
	  		  			<li>
	  						<ul class="product">
	  							<li><div class="blue"></div>
								<li class="img_wrapper"><a href="productInfo.jsp?prod_num=<%=bean.getProd_num()%>"><img src="uploadImage/<%=bean.getImage()%>"></a></li>
	  							<li><a href="#"><%=bean.getTitle() %></a></li>
	  		  					<li><%=bean.getPrice()%>원</li>
	  		  				</ul>
	  		  			</li>
	  		  	<%}%>
  			</ul>
  		</div>
  		<jsp:include page="bottom.jsp"/>
	</div>
</body>
</html>