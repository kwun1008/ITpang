<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<header>
			<div class="loginbox">
				<ul>
					<%
					String id = (String)session.getAttribute("id");
					if(id==null){
					%>
					<li><a href="login.jsp">로그인</a></li>|
					<li><a href="join.jsp">회원가입</a></li>
					<%
					} else{
					%>
					<li><a href=""><%=id %>님</a></li>|
					<li><a href="logout.jsp">로그아웃</a></li>
					<%
					}
					%>
				</ul>
			</div>
			<div class="logo" style="margin-top:90px;">
				<a href="index.jsp"><img src="images/coupang.png" style="width:200px;"></a>
			</div>
			<div class="search">
				<form action="index.jsp" class="search_frm">
					<select name="category" class="category">
						<option value="">전체</option>
						<option value="식품">식품</option>
						<option value="의류">의류</option>
						<option value="생활용품">생활용품</option>
						<option value="도서">도서</option>
						<option value="뷰티">뷰티</option>
					</select>
					<input type="text" class="search_text" name="search">
					<button type="submit" class="search_btn"><img src="images/search.png"></button>
				</form> 
			</div>
			<%
			if(id!=null){
			%>
			<div class="mypage">
				<div class="left">
					<ul>
						<li><a href="write.jsp"><img src="images/sell.png"></a></li>
						<li><a href="write.jsp" style="text-decoration:none; color:black;">상품등록</a></li>
					</ul>
				</div>
				<div class="right">
					<ul>
						<li><a href="mypage.jsp"><img src="images/mypage.png"></a></li>
						<li><a href="mypage.jsp" style="text-decoration:none; color:black;">My Page</a></li>
					</ul>
				</div>
			</div>
			<%}%>
			<br><br><br><br><br><br><br><br><br><br><hr>
			<div class="menu" id="menu">
				<ul>
					<li class="menu1"><a href="index.jsp?category=식품"><img src="images/menu1_out.png"></a>
						
					</li><!-- 
				--><li class="menu2"><a href="index.jsp?category=의류"><img src="images/menu2_out.png"></a>
						
					</li><!-- 
				--><li class="menu3"><a href="index.jsp?category=생활용품"><img src="images/menu3_out.png"></a>
						
					</li><!-- 
				--><li class="menu4"><a href="index.jsp?category=도서"><img src="images/menu4_out.png"></a>
						
					</li><!-- 
				--><li class="menu5"><a href="index.jsp?category=뷰티"><img src="images/menu5_out.png"></a>
						
					</li>
				</ul>
			</div>
		</header>