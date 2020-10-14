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
	//게시글 작성하는 메소드
	public void addBBS(BBSVO bbsvo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql ="insert into BOARD(bbs_no,title,context,posteddate,category,worktime,writer) values(board_seq.nextval,?,?,sysdate,?,?,?)";
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bbsvo.getTitle());
			pstmt.setString(2, bbsvo.getContext());
			pstmt.setString(3, bbsvo.getCategory());
			pstmt.setString(4, bbsvo.getWorkTime());
			pstmt.setString(5, bbsvo.getVo().getId());
			pstmt.execute();
		} finally {
			closeAll(pstmt, con);
		}
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
		
}
