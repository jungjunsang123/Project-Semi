package org.project.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class MemberDAO {
	private static MemberDAO dao=new MemberDAO();	
	private DataSource dataSource;
	private MemberDAO(){
		dataSource=DataSourceManager.getInstance().getDataSource();
	}
	public static MemberDAO getInstance(){
		return dao;
	}
	public Connection getConnection() throws SQLException{
		return dataSource.getConnection();
	}
	public void closeAll(PreparedStatement pstmt,Connection con) throws SQLException{
		if(pstmt!=null)
			pstmt.close();
		if(con!=null)
			con.close(); 
	}
	public void closeAll(ResultSet rs,PreparedStatement pstmt,Connection con) throws SQLException{
		if(rs!=null)
			rs.close();
		closeAll(pstmt,con);

	}
	public MemberVO login(String id, String password) throws SQLException {
		MemberVO vo=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=dataSource.getConnection();
			String sql="SELECT address, name, tel, birth, sex, regdate FROM MEMBER WHERE id=? and password=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs=pstmt.executeQuery();
			if(rs.next())
				vo=new MemberVO(id, password, rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6));
		}finally {
			closeAll(rs,pstmt,con);
		}
		return vo;
	}
	public void register(MemberVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=dataSource.getConnection();
			String sql="INSERT INTO MEMBER(ID,PASSWORD,ADDRESS,NAME,TEL,BIRTH,SEX,REGDATE) values(?,?,?,?,?,?,?,sysdate)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPassword());
			pstmt.setString(3, vo.getAddress());
			pstmt.setString(4, vo.getName());
			pstmt.setString(5, vo.getTel());
			pstmt.setString(6, vo.getBirth());
			pstmt.setString(7, vo.getSex());

			pstmt.executeQuery();
		}finally {
			closeAll(pstmt,con);
		}
	}
	//회원 찾기 및 회원정보 가져오기
	public MemberVO findMemberById(String searchText) throws SQLException {
		MemberVO vo=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=dataSource.getConnection();
			String sql="SELECT address, name, tel, sex,birth,star,profile_path FROM MEMBER where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, searchText);
			rs=pstmt.executeQuery();
			if(rs.next())
				vo=new MemberVO(searchText,null,rs.getString(1),rs.getString(2),rs.getString(3),null,rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7));
		}finally {
			closeAll(rs,pstmt,con);
		}
		return vo;
	}
	public boolean idcheck(String id) throws SQLException {
		boolean flag=false;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=dataSource.getConnection();
			String sql="SELECT COUNT(*) FROM MEMBER WHERE ID=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()&&(rs.getInt(1)>0))
				flag=true;
		}finally {
			closeAll(rs,pstmt,con);
		}
		return flag;
	}
	//member db에 있는 total점수를 가지고 오고 review에 씌여진 리뷰개수를 가져온다.
	public String getRatingStar(String id) throws SQLException {
	      float avg=0;
	      String result="0";
	      Connection con =null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      int totalstar=0;
	      int totalreview=1;
	      try {
	         String sql="select star from member where id=?";
	         con=getConnection();
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, id);
	         rs=pstmt.executeQuery();
	         if(rs.next()) {
	            totalstar=rs.getInt(1); //해당 아이디의 총점
	         }
	         con.close();
	         pstmt.close();
	         rs.close();
	         System.out.println("total stars : "+totalstar);
	         sql="select count(*) from review where getreviewer=?";       
	         con=getConnection();
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, id);
	         rs=pstmt.executeQuery();
	         if(rs.next()) {
	            if(rs.getInt(1) != 0)
	        	 totalreview=rs.getInt(1); // 해당 아이디의 리뷰 갯수
	         }
	         avg=(float)totalstar/(float)totalreview;         
	         result = String.format("%.2f", avg);
	         
	      }finally {
	         closeAll(rs, pstmt, con);
	      }
	      return result;
	   }
	//프로필 이미지 업로드
	public void ProfileImgUpload(String mvoId, String profile_path) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=dataSource.getConnection();
			String sql="UPDATE MEMBER set profile_path=? where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, profile_path);
			pstmt.setString(2, mvoId);
			pstmt.executeQuery();
		}finally {
			closeAll(pstmt,con);
		}
	}
	//회원정보 수정
	public void updateInfo(MemberVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=dataSource.getConnection();
			String sql="UPDATE MEMBER set password=?,address=?, name=?, tel=?, sex=?,birth=? where id=?";
			pstmt=con.prepareStatement(sql);
			//id,password,address,name,tel,null,sex,birth)
			pstmt.setString(1, vo.getPassword());
			pstmt.setString(2, vo.getAddress());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getTel());
			pstmt.setString(5, vo.getSex());
			pstmt.setString(6, vo.getBirth());
			pstmt.setString(7, vo.getId());
			pstmt.executeQuery();
		}finally {
			closeAll(pstmt,con);
		}
		
	}

}
