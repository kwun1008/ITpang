<%@page import="user.UserDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text;html/charset=utf-8");
	
	String id = request.getParameter("id");
	PrintWriter print = response.getWriter();
	UserDAO dao = new UserDAO();
	if(dao.checkID(id)){
		out.print("cant");
	}else{
		out.print("can");
	}
%>