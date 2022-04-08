<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
	<jsp:useBean id="bean" class="user.UserBean"/>
	<jsp:setProperty property="*" name="bean"/>
	<jsp:useBean id="dao" class="user.UserDAO"/>
<%
	String addr = request.getParameter("addr1")+" "+request.getParameter("addr2");
	System.out.println(addr);
	bean.setAddr(addr);
	boolean flag = dao.modUser(bean);
	if(flag){
		response.sendRedirect("mypageEnd.jsp");
	}else{
	%>
		<script>
		alert("회원가입 오류 발생");
		history.back();
		</script>
	<%
	}
%>