package org.project.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class BBSDAO {
	private static BBSDAO dao = new BBSDAO();
	private DataSource dataSource;

	private BBSDAO() {
		dataSource = DataSourceManager.getInstance().getDataSource();
	}

	public static BBSDAO getInstance() {
		return dao;
	}

	public Connection getConnection() throws SQLException {
		return dataSource.getConnection();
	}

	// 게시글 작성하는 메소드
	public void addBBS(BBSVO bbsvo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "insert into BOARD(bbs_no,title,context,posteddate,category,startworktime,endworktime,writer) values(board_seq.nextval,?,?,sysdate,?,?,?,?)";
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bbsvo.getTitle());
			pstmt.setString(2, bbsvo.getContext());
			pstmt.setString(3, bbsvo.getCategory());
			pstmt.setString(4, bbsvo.getStartWorkTime());
			pstmt.setString(5, bbsvo.getEndWorkTime());
			pstmt.setString(6, bbsvo.getVo().getId());
			pstmt.execute();
		} finally {
			closeAll(pstmt, con);
		}
	}

	// JS : 게시글 목록 가져오기
	public ArrayList<BBSVO> getPostingList(PagingBean pagingBean) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<BBSVO> list = new ArrayList<BBSVO>();
		try {
			con = getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select B.TITLE, M.ID, B.POSTEDDATE, B.HITS, B.BBS_NO , B.category ");
			sql.append(
					"from( select row_number() over(order by bbs_no desc) as rnum, bbs_no, title, hits, to_char(POSTEDDATE,'yyyy.mm.dd') as POSTEDDATE, writer, category from board) B, MEMBER M ");
			sql.append(" where B.writer = M.ID and rnum between ? and ? ");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, pagingBean.getStartRowNumber());
			pstmt.setInt(2, pagingBean.getEndRowNumber());

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

	// 페이징을 위한 포스트 개수
	public int getTotalPostCount() throws SQLException {
		int total = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "select count(*) from board";
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				total = rs.getInt(1);
			}

		} finally {
			closeAll(rs, pstmt, con);
		}
		return total;
	}

	// 상훈 : 게시물 상세보기
	public BBSVO detailPostingByNo(String bbs_no) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BBSVO vo = null;
		String sql = "select title,context,hits,to_char(posteddate,'yyyy-mm-dd hh24:mm'),category,to_char(startWorkTime,'yyyy-mm-dd'),to_char(endWorkTime,'yyyy-mm-dd'),writer from board where BBS_NO=?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bbs_no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				// public BBSVO(String bbs_no, String title, String context, int hits, String createDate, String category,
				// String startWorkTime, String endWorkTime, MemberVO vo)
				vo = new BBSVO(bbs_no, rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6),rs.getString(7), new MemberVO(rs.getString(8), null, null,null));
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return vo;
	}

	// SH : 글번호에 해당하는 게시물을 삭제하는 메서드
	public void deletePosting(String bbs_no) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			pstmt = con.prepareStatement("DELETE FROM BOARD WHERE bbs_no=?");
			pstmt.setString(1, bbs_no);
			pstmt.executeUpdate();
		} finally {
			closeAll(pstmt, con);
		}
	}

	// SH : 게시물 정보 업데이트하는 메서드
	public void updatePosting(BBSVO vo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			pstmt = con.prepareStatement("update BOARD set TITLE=?, CONTEXT=?, CATEGORY=?, STARTWORKTIME=?,ENDWORKTIME=? WHERE BBS_NO=?");
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContext());
			pstmt.setString(3, vo.getCategory());
			pstmt.setString(4, vo.getStartWorkTime());
			pstmt.setString(5, vo.getEndWorkTime());
			pstmt.setString(6, vo.getBbs_no());
			pstmt.executeUpdate();
		} finally {
			closeAll(pstmt, con);
		}
	}

	// 수민 : 게시물 조회수 +1 메소드
	public void updateBBSHit(String bbs_no) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			String sql = "update BOARD set HITS=HITS+1 where BBS_NO=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bbs_no);
			pstmt.executeUpdate();
		} finally {
			closeAll(pstmt, con);
		}
	}

	//클로즈 메소드	
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

	// SH : 전체게시물 수량 세는 메서드
	public int countAllPosting() throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int total = 0;
		try {
			con = getConnection();
			pstmt = con.prepareStatement("select count(*) from board");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				total = rs.getInt(1);
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return total;
	}

	// SH : 아이돌봄게시물 수량 세는 메서드
	public int countYoungPosting() throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int total = 0;
		try {
			con = getConnection();
			pstmt = con.prepareStatement("select count(*) from board where category='아이돌봄'");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				total = rs.getInt(1);
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return total;
	}

	// SH : 노인케어게시물 수량 세는 메서드
	public int countOldPosting() throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int total = 0;
		try {
			con = getConnection();
			pstmt = con.prepareStatement("select count(*) from board where category='노인케어'");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				total = rs.getInt(1);
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return total;
	}

	// SH : 반려동물게시물 수량 세는 메서드
	public int countPetPosting() throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int total = 0;
		try {
			con = getConnection();
			pstmt = con.prepareStatement("select count(*) from board where category='반려동물'");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				total = rs.getInt(1);
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return total;
	}
	
	// 타이틀 키워드 검색으로 일치하는 게시물 검색하기
	public ArrayList<BBSVO> searchIdTitleByText(String searchText, PagingBean searchTitlepagingBean) throws SQLException{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<BBSVO> list = new ArrayList<BBSVO>();
		StringBuilder sql = new StringBuilder();
		try {
			con=getConnection();
			sql.append("SELECT B.TITLE, M.ID, B.POSTEDDATE, B.HITS, B.BBS_NO , B.category,b.context ");
			sql.append("FROM (SELECT row_number() over(order by bbs_no desc) as rnum, bbs_no, hits, to_char(POSTEDDATE,'YYYY.MM.DD') as POSTEDDATE,");
			sql.append("writer, category, title,context FROM board WHERE TITLE LIKE ?) B, MEMBER M ");
			sql.append("WHERE B.WRITER = M.ID AND rnum between ? and ?");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, "%"+searchText+"%");
			pstmt.setInt(2, searchTitlepagingBean.getStartRowNumber());
			pstmt.setInt(3, searchTitlepagingBean.getEndRowNumber());
			rs=pstmt.executeQuery();
			while(rs.next()) {
				BBSVO bvo=new BBSVO();
				MemberVO mvo=new MemberVO();
				mvo.setId(rs.getString(2));
				bvo.setVo(mvo);
				bvo.setTitle(rs.getString(1));
				bvo.setContext(rs.getString(7));
				bvo.setCreateDate(rs.getString(3));
				bvo.setHits(rs.getInt(4));
				bvo.setBbs_no(rs.getString(5));
				bvo.setCategory(rs.getString(6));
				list.add(bvo);
			}
		}finally {
			closeAll(rs,pstmt,con);
		}
		return list;
	}
	//텍스트로 글내용 검색하기
	public ArrayList<BBSVO>searchContextByText(String searchText, PagingBean searchContextpagingBean) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<BBSVO> list = new ArrayList<BBSVO>();
		StringBuilder sql = new StringBuilder();
		try {
			con=getConnection();
			sql.append("SELECT B.TITLE, M.ID, B.POSTEDDATE, B.HITS, B.BBS_NO , B.category, B.context ");
			sql.append("FROM (SELECT row_number() over(order by bbs_no desc) as rnum, bbs_no, hits, to_char(POSTEDDATE,'YYYY.MM.DD') as POSTEDDATE,");
			sql.append("writer, category, title, context FROM board WHERE CONTEXT LIKE ?) B, MEMBER M ");
			sql.append("WHERE B.WRITER = M.ID AND rnum between ? and ?");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, "%"+searchText+"%");
			pstmt.setInt(2, searchContextpagingBean.getStartRowNumber());
			pstmt.setInt(3, searchContextpagingBean.getEndRowNumber());
			rs=pstmt.executeQuery();
			while(rs.next()) {
				BBSVO searchcontextbvo=new BBSVO();
				MemberVO searchcontextmvo=new MemberVO();
				searchcontextmvo.setId(rs.getString(2));
				searchcontextbvo.setVo(searchcontextmvo);
				searchcontextbvo.setTitle(rs.getString(1)); 
				searchcontextbvo.setCreateDate(rs.getString(3));
				searchcontextbvo.setHits(rs.getInt(4));
				searchcontextbvo.setBbs_no(rs.getString(5));
				searchcontextbvo.setCategory(rs.getString(6));   
				searchcontextbvo.setContext(rs.getString(7)); 
				list.add(searchcontextbvo);
			}
		}finally {
			closeAll(rs,pstmt,con);
		}
		
		return list;
	}
	//수민: 사용자가 작성한 게시물 리스트
	public ArrayList<BBSVO> findPostListById(PagingBean pagingBean,String id) throws SQLException {
		ArrayList<BBSVO> list=new ArrayList<BBSVO>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append("select b.bbs_no,b.title,b.hits,b.posteddate,m.id ");
		    sql.append("from(select row_number() over(order by bbs_no desc) as rnum,bbs_no,title,hits, ");
			sql.append("to_char(posteddate,'YYYY.MM.DD')as posteddate,writer ");
			sql.append("from board where writer=?)b,member m ");
			sql.append("where b.writer=m.id and rnum between ? and ? ");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1,id);
			pstmt.setInt(2,pagingBean.getStartRowNumber());
			pstmt.setInt(3,pagingBean.getEndRowNumber());
			rs=pstmt.executeQuery();
			while(rs.next()) {
				BBSVO bvo=new BBSVO();
				bvo.setBbs_no(rs.getString(1));
				bvo.setTitle(rs.getString(2));
				bvo.setHits(rs.getInt(3));
				bvo.setCreateDate(rs.getString(4));
				MemberVO mvo=new MemberVO();
			    mvo.setId(rs.getString(5));
			    bvo.setVo(mvo);
				list.add(bvo);
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return list;
		
	}
	// 상훈 : 채용 후 리뷰를 아직 쓰지 않은 건수 출력
		public ArrayList<BBSVO> mustReview(String id) throws SQLException {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			ArrayList<BBSVO> list = new ArrayList<BBSVO>();
			try {
				con = getConnection();
				StringBuilder sql = new StringBuilder();
				sql.append("select b.bbs_no,b.title,b.hits,b.posteddate,b.category,b.writer ");
			    sql.append("from(select row_number() over(order by bbs_no desc) as rnum,bbs_no,title,hits, ");
				sql.append("to_char(posteddate,'YYYY.MM.DD')as posteddate,writer,category ");
				sql.append("from board)b,(select * from review where givereviewer=? and ISREVIEW='NO') r ");
				sql.append("where b.bbs_no=r.bbs_no ");
				pstmt = con.prepareStatement(sql.toString());
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					BBSVO bvo = new BBSVO();
					MemberVO mvo = new MemberVO();
					mvo.setId(rs.getString(6));
					bvo.setVo(mvo);
					bvo.setTitle(rs.getNString(2));
					bvo.setCreateDate(rs.getNString(4));
					bvo.setHits(rs.getInt(3));
					bvo.setBbs_no(rs.getString(1));
					bvo.setCategory(rs.getString(5));
					list.add(bvo);
				}
			} finally {
				closeAll(rs, pstmt, con);
			}
			return list;
		}
		//조회수가 높은 게시글 출력
		public ArrayList<BBSVO> PopularityPostList(PagingBean pagingBean) throws SQLException{
			ArrayList<BBSVO> list=new ArrayList<BBSVO>();
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			try {
				con=getConnection();
				StringBuilder sql=new StringBuilder();
				sql.append("select b.bbs_no,b.title,b.posteddate,b.hits,m.id ");
				sql.append("from(select row_number() over(order by hits desc)as rnum,bbs_no,title, ");
				sql.append("to_char(posteddate,'YYYY.MM.DD')as posteddate,hits,writer ");
				sql.append("from board )b,member m ");
				sql.append("where b.writer=m.id ");
				sql.append("and rnum between ? and ? ");
				sql.append("order by b.hits desc");
				pstmt=con.prepareStatement(sql.toString());
				pstmt.setInt(1,pagingBean.getStartRowNumber());
				pstmt.setInt(2,pagingBean.getEndRowNumber());
				rs=pstmt.executeQuery();
				while(rs.next()) {
					BBSVO bvo=new BBSVO();
					bvo.setBbs_no(rs.getString(1));
					bvo.setTitle(rs.getString(2));
					bvo.setCreateDate(rs.getString(3));
					bvo.setHits(rs.getInt(4));
					MemberVO mvo=new MemberVO();
					mvo.setId(rs.getString(5));
					bvo.setVo(mvo);
					list.add(bvo);
				}
			} finally {
				closeAll(rs, pstmt, con);
			}
			return list;
			
		}
		// SH: 아이돌봄 게시물 가져오기
		public ArrayList<BBSVO> getPostingYoungList(PagingBean pagingBean) throws SQLException {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			ArrayList<BBSVO> list = new ArrayList<BBSVO>();
			try {
				con = getConnection();
				StringBuilder sql = new StringBuilder();
				sql.append("select B.TITLE, M.ID, B.POSTEDDATE, B.HITS, B.BBS_NO, B.CATEGORY ");
				sql.append(
						"from( select row_number() over(order by bbs_no desc) as rnum, bbs_no, title, hits, to_char(POSTEDDATE,'yyyy.mm.dd') as POSTEDDATE, writer, CATEGORY from board) B, MEMBER M ");
				sql.append("where B.writer = M.ID and rnum between ? and ? and B.CATEGORY='아이돌봄' ");
				pstmt = con.prepareStatement(sql.toString());
				pstmt.setInt(1, pagingBean.getStartRowNumber());
				pstmt.setInt(2, pagingBean.getEndRowNumber());
				
				rs = pstmt.executeQuery();
				while (rs.next()) {
					BBSVO bbsvo = new BBSVO();
					MemberVO mvo = new MemberVO();
					mvo.setId(rs.getString(2));
					bbsvo.setVo(mvo);
					bbsvo.setTitle(rs.getNString(1));
					bbsvo.setCreateDate(rs.getNString(3));
					bbsvo.setHits(rs.getInt(4));
					bbsvo.setBbs_no(rs.getString(5));
					bbsvo.setCategory(rs.getString(6));
					list.add(bbsvo);
				}
			} finally {
				closeAll(rs, pstmt, con);
			}
			return list;
		}
		// SH: 노인케어 게시물 가져오기
		public ArrayList<BBSVO> getPostingOldList(PagingBean pagingBean) throws SQLException {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			ArrayList<BBSVO> list = new ArrayList<BBSVO>();
			try {
				con = getConnection();
				StringBuilder sql = new StringBuilder();
				sql.append("select B.TITLE, M.ID, B.POSTEDDATE, B.HITS, B.BBS_NO, B.CATEGORY ");
				sql.append(
						"from( select row_number() over(order by bbs_no desc) as rnum, bbs_no, title, hits, to_char(POSTEDDATE,'yyyy.mm.dd') as POSTEDDATE, writer, CATEGORY from board) B, MEMBER M ");
				sql.append("where B.writer = M.ID and rnum between ? and ? and B.CATEGORY='노인케어' ");
				pstmt = con.prepareStatement(sql.toString());
				pstmt.setInt(1, pagingBean.getStartRowNumber());
				pstmt.setInt(2, pagingBean.getEndRowNumber());
				
				rs = pstmt.executeQuery();
				while (rs.next()) {
					BBSVO bbsvo = new BBSVO();
					MemberVO mvo = new MemberVO();
					mvo.setId(rs.getString(2));
					bbsvo.setVo(mvo);
					bbsvo.setTitle(rs.getNString(1));
					bbsvo.setCreateDate(rs.getNString(3));
					bbsvo.setHits(rs.getInt(4));
					bbsvo.setBbs_no(rs.getString(5));
					bbsvo.setCategory(rs.getString(6));
					list.add(bbsvo);
				}
			} finally {
				closeAll(rs, pstmt, con);
			}
			return list;
		}
		// SH: 반려동물 게시물 가져오기
		public ArrayList<BBSVO> getPostingPetList(PagingBean pagingBean) throws SQLException {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			ArrayList<BBSVO> list = new ArrayList<BBSVO>();
			try {
				con = getConnection();
				StringBuilder sql = new StringBuilder();
				sql.append("select B.TITLE, M.ID, B.POSTEDDATE, B.HITS, B.BBS_NO, B.CATEGORY ");
				sql.append(
						"from( select row_number() over(order by bbs_no desc) as rnum, bbs_no, title, hits, to_char(POSTEDDATE,'yyyy.mm.dd') as POSTEDDATE, writer, CATEGORY from board) B, MEMBER M ");
				sql.append("where B.writer = M.ID and rnum between ? and ? and B.CATEGORY='반려동물' ");
				pstmt = con.prepareStatement(sql.toString());
				pstmt.setInt(1, pagingBean.getStartRowNumber());
				pstmt.setInt(2, pagingBean.getEndRowNumber());
				
				rs = pstmt.executeQuery();
				while (rs.next()) {
					BBSVO bbsvo = new BBSVO();
					MemberVO mvo = new MemberVO();
					mvo.setId(rs.getString(2));
					bbsvo.setVo(mvo);
					bbsvo.setTitle(rs.getNString(1));
					bbsvo.setCreateDate(rs.getNString(3));
					bbsvo.setHits(rs.getInt(4));
					bbsvo.setBbs_no(rs.getString(5));
					bbsvo.setCategory(rs.getString(6));
					list.add(bbsvo);
				}
			} finally {
				closeAll(rs, pstmt, con);
			}
			return list;
		}
}
