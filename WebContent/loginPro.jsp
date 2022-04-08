<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	UserDAO dao = new UserDAO();
	String result = dao.login(id, pw); 
	// success : 로그인 성공 / iderror : 아이디 없음 / pwerror : 비밀번호 틀림
	if(result.equals("success")){
		System.out.println("로그인 성공");
		session.setAttribute("id", id);
		session.setMaxInactiveInterval(3600);
		response.sendRedirect("index.jsp");
	}else if(result.equals("iderror")){
		System.out.println("존재하지 않는 아이디입니다.");
		response.sendRedirect("login.jsp");
	}else if(result.equals("pwerror")){
		System.out.println("비밀번호가 틀렸습니다.");
		response.sendRedirect("login.jsp");
	}
%>

