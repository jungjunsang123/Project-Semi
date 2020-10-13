package org.project.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

public class BBSDAO {
	private static BBSDAO dao=new BBSDAO();	
	private DataSource dataSource;
	private BBSDAO(){
		dataSource=DataSourceManager.getInstance().getDataSource();
	}
	public static BBSDAO getInstance(){
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
	public void name() {
		
	}
	//SH : 글번호에 해당하는 게시물을 삭제하는 메서드
	public void deletePosting(int no) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=getConnection();
			pstmt=con.prepareStatement("DELETE FROM BOARD WHERE NO=?");
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		} finally {
			closeAll(pstmt, con);
		}
	}
	//SH : 게시물 정보 업데이트하는 메서드
	public void updatePosting(BBSVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=getConnection();
			pstmt=con.prepareStatement("update BOARD set TITLE=?, CONTEXT=?, CATEGORY=?, WORKTIME WHERE BBS_NO=?");
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContext());
			pstmt.setString(3, vo.getCategory());
			pstmt.setString(4, vo.getWorkTime());
			pstmt.setString(5, vo.getBbs_no());
			pstmt.executeUpdate();
			
		} finally {
			closeAll(pstmt, con);
			
		}
	}
}
