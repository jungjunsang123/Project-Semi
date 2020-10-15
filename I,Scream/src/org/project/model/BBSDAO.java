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
	
	// 게시글 목록 가져오기
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
	//페이징을 위한 포스트 개수 
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
		//상훈 : 게시물 상세보기
		public BBSVO detailPostingByNo(String bbs_no) throws SQLException {
			Connection con =null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			BBSVO vo = null;
			String sql="select * from board where BBS_NO=?";
			try {
				con=getConnection();
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, bbs_no);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					//BBSVO(MemberVO vo, String title, String context, int hits, String createDate, String category,String workTime, String bbs_no)
					vo = new BBSVO(new MemberVO(rs.getString(8), null, null), 
							rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7), bbs_no);
				}
			}finally {
				closeAll(rs, pstmt, con);
			}
			return vo;
		}	
		//SH : 글번호에 해당하는 게시물을 삭제하는 메서드
		public void deletePosting(String bbs_no) throws SQLException {
			Connection con=null;
			PreparedStatement pstmt=null;
			try {
				con=getConnection();
				pstmt=con.prepareStatement("DELETE FROM BOARD WHERE bbs_no=?");
				pstmt.setString(1, bbs_no);
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
				pstmt=con.prepareStatement("update BOARD set TITLE=?, CONTEXT=?, CATEGORY=?, WORKTIME=? WHERE BBS_NO=?");
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

//클로즈 메소드	
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
