package org.project.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;


public class ReviewDAO {
	private static ReviewDAO dao=new ReviewDAO();	
	private DataSource dataSource;
	private ReviewDAO(){
		dataSource=DataSourceManager.getInstance().getDataSource();
	}
	public static ReviewDAO getInstance(){
		return dao;
	}
	public Connection getConnection() throws SQLException{
		return dataSource.getConnection();
	}
	
	
	/*여기 코드*/
	
	
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
	//리뷰 페이징을 위한 포스트 개수
	public int getTotalReviewCount() throws SQLException {
		int totalCount = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con=getConnection();
			String sql="SELECT COUNT(*)FROM BOARD";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next())
				totalCount=rs.getInt(1);
		}finally {
			closeAll(rs,pstmt,con);
		}
		return totalCount;
	}
	//리뷰 목록 가져오기
	public ArrayList<ReviewVO> getReviewList(PagingBean PagingBean) throws SQLException{
		ArrayList<ReviewVO> reviewList = new ArrayList<ReviewVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con=getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT M.ID, R.REVIEWCONTEXT, R.STARS, R.POSTEDDATE,R.BBS_NO ");
			sql.append("FROM (SELECT ROW_NUMBER() OVER(ORDER BY BBS_NO DESC) AS RNUM, ");
			sql.append("BBS_NO, REVIEWCONTEXT, STARS, TO_CHAR(POSTEDDATE,'YYYY.MM.DD') AS POSTEDDATE, ");
			sql.append("giveReviewer FROM REVIEW) R, MEMBER M ");
			sql.append("WHERE R.giveReviewer = M.ID AND RNUM BETWEEN ? AND ?");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, PagingBean.getStartRowNumber());
			pstmt.setInt(2, PagingBean.getEndRowNumber());
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ReviewVO rvo=new ReviewVO(); 
				MemberVO mvo=new MemberVO();
				BBSVO bvo = new BBSVO();
				bvo.setBbs_no(rs.getString(5));
				mvo.setId(rs.getString(1));
				rvo.setbVO(bvo);
				rvo.setGiveReviewer(mvo);
				rvo.setReview_context(rs.getString(2));
				rvo.setStars(rs.getInt(3));
				rvo.setCreateDate(rs.getString(4));
				reviewList.add(rvo);
			}
		}finally {
			closeAll(rs,pstmt,con);
		}
		return reviewList;
	}
	
	  public ReviewVO reviewDetailById(String bbs_no, String id) throws SQLException { 
		  Connection con=null;
		  PreparedStatement pstmt=null; 
		  ResultSet rs=null; 
		  ReviewVO rvo=null;
		  StringBuilder sql=new StringBuilder();
		  sql.append("SELECT M.ID, R.REVIEWCONTEXT, R.STARS, R.POSTEDDATE, R.BBS_NO ");
		  sql.append("FROM MEMBER M, REVIEW R "); 
		  sql.append("WHERE R.giveReviewer = M.ID AND R.BBS_NO = ? AND M.ID = ?");
		  try {
			  con=getConnection();
			  pstmt=con.prepareStatement(sql.toString());
			  pstmt.setString(1, bbs_no);
			  pstmt.setString(2, id);
			  rs=pstmt.executeQuery();
			  if(rs.next()) {
				  rvo=new ReviewVO();
				  rvo.setReview_context(rs.getString(2));
				  rvo.setStars(rs.getInt(3));
				  rvo.setCreateDate(rs.getString(4));
				  MemberVO mvo=new MemberVO();
				  mvo.setId(id);
				  rvo.setGiveReviewer(mvo);
				  rvo.setbVO(new BBSVO(null, null, null, 0, null, null, null, bbs_no));
				  ;
			  }
		  }finally {
			  closeAll(rs,pstmt,con);
		  }
		  return rvo;
	  }
	  
	  public void reviewAdd(BBSVO bvo, int stars) throws SQLException {
		  Connection con=null;
		  PreparedStatement pstmt=null;
		  try {
			  con=getConnection();
			  String sql="UPDATE REVIEW SET reviewContext=?, stars=?, posteddate=sysdate, isReview='YES' WHERE bbs_no=?";
			  pstmt=con.prepareStatement(sql);
			 pstmt.setString(1, bvo.getContext());
			 pstmt.setInt(2, stars);
			 pstmt.setString(3, bvo.getBbs_no());
			  pstmt.executeUpdate();
		  }finally {
			  closeAll(pstmt,con);
		  }
	  }
	public String getBBS_NO(String id) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String result="";
		try {
			String sql="SELECT BBS_NO FROM Review WHERE isReview = 'NO' AND giveReviewer = ? ";
			con=getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getString(1);
			}
		}finally {
			closeAll(rs,pstmt,con);
		}
		return result;
	}	
}
