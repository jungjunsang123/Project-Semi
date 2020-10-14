package org.project.model;

import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

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
	public ArrayList<BBSVO> getPostingList(PagingBean pagingBean) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		ArrayList<BBSVO> list = new ArrayList<BBSVO>();
		try {
			String sql="select B.TITLE, M.ID, B.POSTEDDATE, B.HITS, B.BBS_NO from( select row_number() over(order by bbs_no desc) as rnum, bbs_no, title, hits, to_char(POSTEDDATE,'yyyy.mm.dd') as POSTEDDATE, writer from board) B, MEMBER M where B.writer = M.ID and rnum between 1 and 10 ";
			con = getConnection();
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				BBSVO bbsvo = new BBSVO();
				MemberVO mvo = new MemberVO();
				mvo.setId(rs.getString(2));
				bbsvo.setVo(mvo);
				bbsvo.setTitle(rs.getNString(1));
				bbsvo.setCreateDate(rs.getNString(3));
				bbsvo.setHits(rs.getInt(4));
				bbsvo.setBbs_no(rs.getString(5));
				list.add(bbsvo);
			}
		}finally {
			closeAll(rs, pstmt, con);
		}
		return list;
	}
	public int getTotalPostCount() throws SQLException {
		int total = 0;
		Connection con =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql="select count(*) from board";
			con=getConnection();
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				total=rs.getInt(1);
			}
		}finally {
			closeAll(rs, pstmt, con);
		}
		return total;
	}	
}
