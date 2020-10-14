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
				con = getConnection();
				StringBuilder sql=new StringBuilder();		
				sql.append("select B.TITLE, M.ID, B.POSTEDDATE, B.HITS, B.BBS_NO ");
				sql.append("from( select row_number() over(order by bbs_no desc) as rnum, bbs_no, title, hits, to_char(POSTEDDATE,'yyyy.mm.dd') as POSTEDDATE, writer from board) B, MEMBER M ");
				sql.append("where B.writer = M.ID and rnum between ? and ?");
				pstmt=con.prepareStatement(sql.toString());
				pstmt.setInt(1, pagingBean.getStartRowNumber());
				pstmt.setInt(2, pagingBean.getEndRowNumber());
				
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
		
		
		
		
		public void updateBBSHit(String bbs_no) throws SQLException {
		      Connection con=null;
		      PreparedStatement pstmt=null;
		      try {
		         con=getConnection();
		        String sql="update BOARD set HITS=HITS+1 where BBS_NO=?";
		           pstmt=con.prepareStatement(sql);
		             pstmt.setString(1,bbs_no);
		            pstmt.executeUpdate();
		      }finally {
		         closeAll(pstmt,con);
		      }
		   }
		   public BBSVO getPostDetail(String no) throws SQLException {
		      BBSVO pvo=null;
		      Connection con=null;
		      PreparedStatement pstmt=null;
		      ResultSet rs=null;
		      try {
		         con=getConnection();
		         StringBuilder sql=new StringBuilder();
		           sql.append("select b.bbs_no,b.title,b.context,b.hits,to_char(POSTEDDATE,'YYYY.MM.DD') as POSTEDDATE,m.id ");
		           sql.append("from board b,member m  ");
		           sql.append("where b.writer=m.id order by bbs_no desc");
		           pstmt=con.prepareStatement(sql.toString());
		           rs=pstmt.executeQuery();
		           if(rs.next()) {
		              pvo=new BBSVO();
		              pvo.setBbs_no(rs.getString(1));
		              pvo.setTitle(rs.getString(2));
		              pvo.setContext(rs.getString(3));
		              pvo.setHits(rs.getInt(4));
		              pvo.setCreateDate(rs.getString(5));
		              MemberVO mvo=new MemberVO();
		              mvo.setId(rs.getString(6));
		              pvo.setVo(mvo);
		           }
		      } finally {
		         closeAll(rs, pstmt, con);
		      }
		      return pvo;
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
