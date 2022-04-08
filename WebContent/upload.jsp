<%@page import="java.sql.Timestamp"%>
<%@page import="product.ProductDAO"%>
<%@page import="product.ProductBean"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	ServletContext ctx = getServletContext();
	String realPath = ctx.getRealPath("uploadImage");
	int max = 1024*1024*10;
	MultipartRequest multi = new MultipartRequest(request, realPath, max, "utf-8", new DefaultFileRenamePolicy());
	String id = multi.getParameter("id");
	String title = multi.getParameter("title");
	String price = multi.getParameter("price");
	String info = multi.getParameter("info");
	String image = "";
	String category = multi.getParameter("category");
	boolean fileTypeCheck;
	Enumeration e = multi.getFileNames();
	while(e.hasMoreElements()){
		String fileName = (String)e.nextElement();
		image = multi.getFilesystemName(fileName);
		System.out.println("실제 업로드된 파일 이름 : "+image);
	}
	ProductDAO dao = new ProductDAO();
	int user_num = dao.selectUserNum(id);
	ProductBean bean = new ProductBean();
	bean.setTitle(title);
	bean.setUser_num(user_num);
	bean.setDate( new Timestamp(System.currentTimeMillis()));
	bean.setPrice(price);
	bean.setInfo(info);
	bean.setImage(image);
	bean.setCategory(category);
	
	if(dao.insertProduct(bean)){
		response.sendRedirect("index.jsp");
	}else{
		%>
		<script>
			alert("상품 등록에 실패하였습니다.");
			history.back();
		</script>
		<%
	}
	
	
%>