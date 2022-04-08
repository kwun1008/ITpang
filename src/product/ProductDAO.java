package product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ProductDAO {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		private Connection getConnection() throws Exception{
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/jspbeginner");
			con = ds.getConnection();
			return con;
		}
		
		public boolean insertProduct(ProductBean bean){
			boolean flag = false;
			try{
				con = getConnection();
				String sql = "insert into product(title, user_num, date, price, info, readcount, ordercount, image, category)"
						+ "values(?,?,?,?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, bean.getTitle());
				pstmt.setInt(2, bean.getUser_num());
				pstmt.setTimestamp(3, bean.getDate());
				pstmt.setString(4, bean.getPrice());
				pstmt.setString(5, bean.getInfo());
				pstmt.setInt(6, 0);
				pstmt.setInt(7, 0);
				pstmt.setString(8, bean.getImage());
				pstmt.setString(9, bean.getCategory());
				pstmt.executeUpdate();
				flag = true;
			}catch(Exception e){
				System.out.println("writeProduct 메소드 오류 : "+e);
			}finally{
				freeConnection(con, pstmt);
			}
			return flag;
		}
		
		public int selectUserNum(String id){
			int user_num = -1;
			try{
				con = getConnection();
				String sql = "select user_num from user where id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				while(rs.next()){
					user_num = rs.getInt("user_num");
				}
			}catch(Exception e){
				System.out.println("selectUserNum 메소드 오류 : "+e);
			}finally{
				freeConnection(con, pstmt, rs);
			}
			return user_num;
		}
		
		public int maxProduct(){
			int max = 0;
			try{
				con = getConnection();
				String sql = "select count(*) from product";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
					max = rs.getInt(1);
				}
			}catch(Exception e){
				System.out.println("maxProduct 메소드 오류 : "+e);
			}finally{
				freeConnection(con, pstmt, rs);
			}
			return max;
		}
		
		public int categoryMaxProduct(String category){
			int max = 0;
			try{
				con = getConnection();
				String sql = "select count(*) from product where category=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, category);
				rs = pstmt.executeQuery();
				while(rs.next()){
					max = rs.getInt(1);
				}
			}catch(Exception e){
				System.out.println("categoryMaxProduct 메소드 오류 : "+e);
			}finally{
				freeConnection(con, pstmt, rs);
			}
			return max;
		}
		
		public int maxPage(int Size){
			int max = 0;
			try{
				con = getConnection();
				String sql = "select count(*) from product";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
					int allBoard = rs.getInt(1);
					if(allBoard % Size ==0){
						max = allBoard/Size;
					}
					else{
						max = (allBoard/Size)+1;
					}
				}
			}catch(Exception e){
				System.out.println("maxPage 메소드 오류 : "+e);
			}finally{
				freeConnection(con, pstmt, rs);
			}
			return max;
		}
		
		public int categoryMaxPage(int Size, String category){
			int max = 0;
			try{
				con = getConnection();
				String sql = "select count(*) from product where category=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, category);
				rs = pstmt.executeQuery();
				while(rs.next()){
					int allBoard = rs.getInt(1);
					if(allBoard % Size ==0){
						max = allBoard/Size;
					}
					else{
						max = (allBoard/Size)+1;
					}
				}
			}catch(Exception e){
				System.out.println("categoryMaxPage 메소드 오류 : "+e);
			}finally{
				freeConnection(con, pstmt, rs);
			}
			return max;
		}
		
		public ArrayList<ProductBean> selectProduct(String category, String search){
			//각 페이지마다 첫번째로 보여질 시작 글번호와 페이지 당 보여질 글 갯수를 전달받음
			ArrayList<ProductBean> list = new ArrayList<ProductBean>();
			try{
				con = getConnection();
				String sql = "";
				if(category==null || category.length()==0) {
					if(search==null || search.length()==0) {
						sql = "select * from product order by date desc";
					}else {
						sql = "select * from product where title like '%"+search+"%' order by date desc";
					}
				}else {
					if(search==null || search.length()==0) {
						sql = "select * from product where category='"+category+"' order by date desc";
					}else {
						sql = "select * from product where category='"+category+"' and title like '%"+search+"%' order by date desc";
					}
				}
				// limt A, B : select 구문의 결과 중 A번째행부터 B개를 반환 
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
					ProductBean bean = new ProductBean();
					bean.setProd_num(rs.getInt("prod_num"));
					bean.setTitle(rs.getString("title"));
					bean.setUser_num(rs.getInt("user_num"));
					bean.setDate(rs.getTimestamp("date"));
					bean.setPrice(rs.getString("price"));
					bean.setInfo(rs.getString("info"));
					bean.setReadcount(rs.getInt("readcount"));
					bean.setOrdercount(rs.getInt("ordercount"));
					bean.setImage(rs.getString("image"));
					list.add(bean);
				}
			}catch(Exception e){
				System.out.println("selectProduct 메소드 오류 : "+e);
			}finally{
				freeConnection(con, pstmt, rs);
			}
			return list;
		}
		
		public ProductBean selectNumProduct(int prod_num){
			ProductBean bean = new ProductBean();
			try{
				con = getConnection();
				String sql = "select * from product where prod_num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, prod_num);
				rs = pstmt.executeQuery();
				while(rs.next()){
					bean.setProd_num(rs.getInt("prod_num"));
					bean.setTitle(rs.getString("title"));
					bean.setUser_num(rs.getInt("user_num"));
					bean.setDate(rs.getTimestamp("date"));
					bean.setPrice(rs.getString("price"));
					bean.setInfo(rs.getString("info"));
					bean.setReadcount(rs.getInt("readcount"));
					bean.setOrdercount(rs.getInt("ordercount"));
					bean.setImage(rs.getString("image"));
					bean.setCategory(rs.getString("category"));
				}
			}catch(Exception e){
				System.out.println("selectNumProduct 메소드 오류 : "+e);
			}finally{
				freeConnection(con, pstmt, rs);
			}
			return bean;			
		}
		
		public String selectNickname(int user_num) {
			String nickname="";
			try{
				con = getConnection();
				String sql = "select nickname from user where user_num="+user_num;
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery(sql);
				while(rs.next()) {
					nickname = rs.getString("nickname");
				}
			}catch(Exception e){
				System.out.println("selectNickname 메소드 오류 : "+e);
			}finally{
				freeConnection(con, pstmt, rs);
			}
			return nickname;
		}
		
		
		public ArrayList<ProductBean> categoryProduct(int index, int pageSize, String category){
			//각 페이지마다 첫번째로 보여질 시작 글번호와 페이지 당 보여질 글 갯수를 전달받음
			ArrayList<ProductBean> list = new ArrayList<ProductBean>();
			try{
				con = getConnection();
				String sql = "select * from product where category=? order by date desc limit ?,?";
				// limt A, B : select 구문의 결과 중 A번째행부터 B개를 반환 
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, category);
				pstmt.setInt(2, index);
				pstmt.setInt(3, pageSize);
				rs = pstmt.executeQuery();
				while(rs.next()){
					ProductBean bean = new ProductBean();
					bean.setProd_num(rs.getInt("prod_num"));
					bean.setTitle(rs.getString("title"));
					bean.setUser_num(rs.getInt("user_num"));
					bean.setDate(rs.getTimestamp("date"));
					bean.setPrice(rs.getString("price"));
					bean.setInfo(rs.getString("info"));
					bean.setReadcount(rs.getInt("readcount"));
					bean.setOrdercount(rs.getInt("ordercount"));
					bean.setImage(rs.getString("image"));
					list.add(bean);
				}
			}catch(Exception e){
				System.out.println("categoryProduct 메소드 오류 : "+e);
			}finally{
				freeConnection(con, pstmt, rs);
			}
			return list;
		}
		
		private void freeConnection(Connection con, PreparedStatement pstmt){
			try{
				if(pstmt!=null){
					pstmt.close();
				}
				if(con!=null){
					con.close();
				}
			}catch(Exception e){
				System.out.println("freeConnection 메소드 오류 : "+e);
			}
		}//freeConnection
		
		private void freeConnection(Connection con, PreparedStatement pstmt, ResultSet rs){
			try{
				if(rs!=null){
					rs.close();
				}
				if(pstmt!=null){
					pstmt.close();
				}
				if(con!=null){
					con.close();
				}
			}catch(Exception e){
				System.out.println("freeConnection 메소드 오류 : "+e);
			}
		}//freeConnection
}