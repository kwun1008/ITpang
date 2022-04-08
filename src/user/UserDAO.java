package user;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserDAO {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		private Connection getConnection() throws Exception{
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/jspbeginner");
			con = ds.getConnection();
			return con;
		}
		
		public boolean joinUser(UserBean bean){
			boolean flag = false;
			try{
				con = getConnection();
				String sql = "insert into user(id, pw, name, nickname, birth, phone, email, addr)"
						+ "values(?,?,?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, bean.getId());
				pstmt.setString(2, bean.getPw());
				pstmt.setString(3, bean.getName());
				pstmt.setString(4, bean.getNickname());
				Date birth = java.sql.Date.valueOf(bean.getBirth());
				pstmt.setDate(5, birth);
				pstmt.setString(6, bean.getPhone());
				pstmt.setString(7, bean.getEmail());
				pstmt.setString(8, bean.getAddr());
				pstmt.executeUpdate();
				flag = true;
			}catch(Exception e){
				System.out.println("joinUser 메소드 오류 : "+e);
			}finally{
				freeConnection(con, pstmt);
			}
			return flag;
		}
		
		public UserBean selectUser(String id) {
			UserBean bean = new UserBean();
			try{
				con = getConnection();
				String sql = "select * from user where id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
				bean.setId(rs.getString("id"));
				bean.setName(rs.getString("name"));
				bean.setNickname(rs.getString("nickname"));
				}
				
				
			}catch(Exception e){
				System.out.println("selectUser 메소드 오류 : "+e);
			}finally{
				freeConnection(con, pstmt);
			}
			return bean;
		}
		
		public boolean modUser(UserBean bean) {
			boolean flag = false;
			try{
				con = getConnection();
				String sql = "update user set pw=?, name=?, nickname=?, birth=?, phone=?, email=?, addr=? where id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, bean.getPw());
				pstmt.setString(2, bean.getName());
				pstmt.setString(3, bean.getNickname());
				Date birth = java.sql.Date.valueOf(bean.getBirth());
				pstmt.setDate(4, birth);
				pstmt.setString(5, bean.getPhone());
				pstmt.setString(6, bean.getEmail());
				pstmt.setString(7, bean.getAddr());
				pstmt.setString(8, bean.getId());
				pstmt.executeUpdate();
				flag = true;
			}catch(Exception e){
				System.out.println("modUser 메소드 오류 : "+e);
			}finally{
				freeConnection(con, pstmt);
			}
			return flag;
		}

		
		public boolean checkID(String id){
			boolean flag = false;
			try{
				con = getConnection();
				String sql = "select id from user where id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				while(rs.next()){
					flag = true;
				}
			}catch(Exception e){
				System.out.println("checkID 메소드 오류 : "+e);
			}finally{
				freeConnection(con, pstmt, rs);
			}
			return flag;
		}
		
		public String login(String id, String pw){
			String flag = "iderror";
			boolean check = checkID(id);
			try{
				con = getConnection();
				if(check){
					String sql = "select pw from user where id = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, id);
					rs = pstmt.executeQuery();
					while(rs.next()){
						if(pw.equals(rs.getString("pw"))){
							flag = "success";
						}
						else{
							flag = "pwerror";
						}
					}
				}
			}catch(Exception e){
				System.out.println("login 메소드 오류 : "+e);
			}finally{
				freeConnection(con, pstmt, rs);
			}
			return flag;
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
