package org.project.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
	public int getTotalScrapCount(String id) throws SQLException {
		int totalCount = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con=getConnection();
			String sql="SELECT COUNT(*) FROM scrap where scraper=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next())
				totalCount=rs.getInt(1);
		}finally {
			closeAll(rs,pstmt,con);
		}
		return totalCount;
	}

	public ArrayList<BBSVO> getScrapList(PagingBean pagingBean, String id) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<BBSVO> list = new ArrayList<BBSVO>();
		try {
			con = getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select B.TITLE, b.writer, B.POSTEDDATE, B.HITS, B.BBS_NO , B.category ");
			sql.append("from( select row_number() over(order by bbs_no desc) as rnum, bbs_no, title, hits, to_char(POSTEDDATE,'yyyy.mm.dd') as POSTEDDATE, writer, category from board) B, (select * from scrap where scraper=?) s ");
			sql.append(" where b.bbs_no=s.bbs_no and rnum between ? and ? ");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setInt(2, pagingBean.getStartRowNumber());
			pstmt.setInt(3, pagingBean.getEndRowNumber());

			rs = pstmt.executeQuery();
			while (rs.next()) {
				BBSVO bbsvo = new BBSVO();
				MemberVO mvo = new MemberVO();
				mvo.setId(rs.getString(2));				
				bbsvo.setTitle(rs.getNString(1));
				bbsvo.setCreateDate(rs.getNString(3));
				bbsvo.setHits(rs.getInt(4));
				bbsvo.setBbs_no(rs.getString(5));
				bbsvo.setCategory(rs.getString(6));
				bbsvo.setVo(mvo);
				list.add(bbsvo);
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return list;
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
