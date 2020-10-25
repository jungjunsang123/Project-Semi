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
	//카테고리별 평균점수가 3.8 이상인 멤버들을 AryList 에 담는 메소드
	public ArrayList<MemberVO> getAVGStar(String category) throws SQLException {
		Connection con= null;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		ArrayList<MemberVO> list =new ArrayList<MemberVO>();
		MemberVO vo;
		try {
			StringBuilder sql = new StringBuilder();
			sql.append(" select  getreviewer, avg(stars) as avgStars ");
			sql.append(" from (select  r.* from board b, review r  where b.bbs_no = r.bbs_no and b.category=?) ");
			sql.append(" group by getReviewer  having avg(stars) > 3.8 order by avgStars desc  ");
			// 평균 별점이 1점이상 인사람 뽑아옴
			con = getConnection();
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				float tmp = rs.getFloat(2);
				vo = new MemberVO();
				String avg_tmp = String.format("%.2f", tmp);
				vo.setId(rs.getString(1));
				vo.setstar(avg_tmp);
				list.add(vo);
			}
		}finally {
			closeAll(rs, pstmt, con);
		}
		return list;
	}
	//사용자에 대한 평점 조회
	public String getAVGStarById(String id) throws SQLException {
		Connection con= null;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		String avg_tmp="";
		try {
			StringBuilder sql = new StringBuilder();
			sql.append(" select getreviewer, avg(stars) as avgStars  ");
			sql.append(" from (select  r.* from board b, review r  where b.bbs_no = r.bbs_no and r.getreviewer=?) ");
			sql.append(" group by getReviewer order by avgStars desc  ");
			// 평균 별점이 1점이상 인사람 뽑아옴
			con = getConnection();
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				float tmp = rs.getFloat(2);
				avg_tmp = String.format("%.2f", tmp);
			}
			else
				avg_tmp="0";
		}finally {
			closeAll(rs, pstmt, con);
		}
		return avg_tmp;
	}
	//리뷰 페이징을 위한 포스트 개수
	public int getTotalReviewCount() throws SQLException {
		int totalCount = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con=getConnection();
			String sql="SELECT COUNT(*)FROM review";
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
	public ArrayList<ReviewVO> getReviewList(PagingBean PagingBean,String id) throws SQLException{
		ArrayList<ReviewVO> reviewList = new ArrayList<ReviewVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con=getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT R.giveReviewer, R.REVIEWCONTEXT, R.STARS, R.POSTEDDATE,R.BBS_NO ");
			sql.append("FROM (SELECT ROW_NUMBER() OVER(ORDER BY BBS_NO DESC) AS RNUM, ");
			sql.append("BBS_NO, REVIEWCONTEXT, STARS, TO_CHAR(POSTEDDATE,'YYYY.MM.DD') AS POSTEDDATE, ");
			sql.append("giveReviewer FROM REVIEW where getReviewer=?) R, MEMBER M ");
			sql.append("WHERE R.giveReviewer = M.ID AND RNUM BETWEEN ? AND ?");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setInt(2, PagingBean.getStartRowNumber());
			pstmt.setInt(3, PagingBean.getEndRowNumber());
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
		  sql.append("SELECT M.ID, R.REVIEWCONTEXT, R.STARS, R.POSTEDDATE,R.GETREVIEWER ");
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
				  mvo.setId(rs.getString(5));
				  rvo.setbVO(new BBSVO(null, null, null, 0, null, null, null, bbs_no));
				  ;
			  }
		  }finally {
			  closeAll(rs,pstmt,con);
		  }
		  return rvo;
	  }
	  //리뷰추가
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
	  //리뷰를 주는 사람중 안쓴 게시물의 번호를 받아옴
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
