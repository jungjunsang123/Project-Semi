package org.project.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

public class ScrapDAO {
	private static ScrapDAO dao = new ScrapDAO();
	private DataSource dataSource;

	private ScrapDAO() {
		dataSource = DataSourceManager.getInstance().getDataSource();
	}

	public static ScrapDAO getInstance() {
		return dao;
	}

	public Connection getConnection() throws SQLException {
		return dataSource.getConnection();
	}

	public void addScrap(String bbs_no, String id) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=getConnection();
			String sql="insert into scrap(bbs_no,scraper) values(?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,bbs_no);
			pstmt.setString(2,id);
			pstmt.executeUpdate();
		} finally {
			closeAll(pstmt, con);
		}
	}

	public void deleteScrap(String bbs_no, String id) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=getConnection();
			String sql="delete from scrap where bbs_no=? and scraper=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,bbs_no);
			pstmt.setString(2,id);
			pstmt.executeUpdate();
		} finally {
			closeAll(pstmt, con);
		}
	}
	public boolean IsScrap(String bbs_no, String id) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//스크랩됐는지 확인
		String sql="select count(*) from scrap where bbs_no=? and scraper=?";
		boolean flag=false;
		try {
			 con = getConnection();
			 pstmt = con.prepareStatement(sql);
			 pstmt.setString(1,bbs_no);
			 pstmt.setString(2,id);
			 rs = pstmt.executeQuery();
			 if(rs.next()) {
				 //이미 scrap에 insert가 된 경우
				if(rs.getInt(1)>0)
					flag=true;
			 }
		} finally {
			closeAll(rs, pstmt, con);
		}
		return flag;
	}
	public void closeAll(PreparedStatement pstmt, Connection con) throws SQLException {
		if (pstmt != null)
			pstmt.close();
		if (con != null)
			con.close();
	}

	public void closeAll(ResultSet rs, PreparedStatement pstmt, Connection con) throws SQLException {
		if (rs != null)
			rs.close();
		closeAll(pstmt, con);

	}

	

}
