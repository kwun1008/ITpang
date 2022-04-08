<%@page import="java.io.PrintWriter"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	PrintWriter alert = response.getWriter();
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
		alert.println("<script language='javascript'>alert('존재하지 않는 아이디입니다.'); location.href='login.jsp';</script>");
		System.out.println("아이디 오류");
		//response.sendRedirect("login.jsp");
	}else if(result.equals("pwerror")){
		alert.println("<script language='javascript'>alert('비밀번호가 틀렸습니다.'); location.href='login.jsp';</script>");
		System.out.println("비밀번호 오류");
	}
%>

