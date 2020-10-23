package org.project.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class ApplyDAO {
	private static ApplyDAO dao = new ApplyDAO();
	private DataSource dataSource;

	private ApplyDAO() {
		dataSource = DataSourceManager.getInstance().getDataSource();
	}

	public static ApplyDAO getInstance() {
		return dao;
	}

	public Connection getConnection() throws SQLException {
		return dataSource.getConnection();
	}

	// 고용주 게시물에서 지원자 출력
	public ArrayList<MemberVO> listApplyer(String bbs_no) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		// 게시물에 대해서 지원한 사람의 아이디와 평점을 가져온다.
		String sql = "select a.id,m.name from member m,(select * from apply where bbs_no=?) a where a.id=m.id";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bbs_no);
			System.out.println(bbs_no);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberVO vo = new MemberVO(rs.getString(1), rs.getString(2), null, null);
				vo.setstar(MemberDAO.getInstance().getRatingStar(vo.getId()));
				list.add(vo);
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return list;
	}

	// 채용 처리 메소드
	public void recruit(String bbs_no, String applyID) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		// 채용된 사람 및 안된 사람에 대한 db 데이터 변경
		// id가 채용된 지원자인경우에만 채용결과에 yes를 넣고 아니면 no라고 입력
		String sql = "update apply set hiredResult = CASE when id=? then 'YES' ELSE 'FAIL' end where bbs_no=?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, applyID);
			pstmt.setString(2, bbs_no);
			pstmt.execute();
		} finally {
			closeAll(pstmt, con);
		}
	}

	// 채용여부 확인
	public String recruitResultConfirm(String bbs_no, String id) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String hiredResult = "";
		String sql = "select hiredResult from apply where id=? and bbs_no=?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, bbs_no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				hiredResult = rs.getString(1);
			}
		} finally {
			closeAll(pstmt, con);
		}
		return hiredResult;
	}

	// 내가 지원한 게시물 endwork 확인
	public void applyEndWork(String id) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select b.bbs_no,b.writer from board b,(select * from apply where id=? and hiredResult='NO') a where b.bbs_no = a.bbs_no";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
					String bbs_no = rs.getString(1);
					boolean isendwork_flag = ApplyDAO.getInstance().endWork(bbs_no);
					boolean isRightForReview_IsFlag = ApplyDAO.getInstance().isRightForReview(bbs_no);
					// isendwork_flag 가 true면 업무가 종료됨, false면 업무진행중
					if (isendwork_flag && !isRightForReview_IsFlag) {
						String bbs_writer = rs.getString(2);
						RightForReview(bbs_no, bbs_writer, id);
						RightForReview(bbs_no, id, bbs_writer);
					}
					// 업무종료일까지 채용이 안된사람은 hiredresult를 기간만료로 설정하기
					else if (isendwork_flag && isRightForReview_IsFlag) {
						expiredApply(bbs_no, id);
				}
				

			}
		} finally {
			closeAll(pstmt, con);
		}
	}
	// 내가 작성한 게시물 endwork 확인
	public void writerEndWork(String id) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select b.bbs_no,a.id from (select * from board where writer=?) b, (select * from apply where hiredresult='NO') a where b.bbs_no = a.bbs_no";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String bbs_no = rs.getString(1);
				boolean isendwork_flag = ApplyDAO.getInstance().endWork(bbs_no);
				boolean isRightForReview_IsFlag = ApplyDAO.getInstance().isRightForReview(bbs_no);
				// isendwork_flag 가 true면 업무가 종료됨, false면 업무진행중
				if (isendwork_flag && !isRightForReview_IsFlag) {
					String bbs_writer = rs.getString(2);
					RightForReview(bbs_no, bbs_writer, id);
					RightForReview(bbs_no, id, bbs_writer);
				}
				// 업무종료일까지 채용이 안된사람은 hiredresult를 기간만료로 설정하기
				else if (isendwork_flag && isRightForReview_IsFlag) {
					expiredApply(bbs_no, id);
				}
			}
		} finally {
			closeAll(pstmt, con);
		}
	}

	// 지원한 게시물 출력 리스트
	public ArrayList<BBSVO> findApplyList(String id) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<BBSVO> list = new ArrayList<BBSVO>();
		// 지원한 게시물 가져오기
		String sql = "select b.bbs_no,b.title,b.context,b.hits,b.POSTEDDATE,b.category,b.writer,a.hiredResult from board b, (select * from apply where id=?) a where b.bbs_no=a.bbs_no";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String bbs_no = rs.getString(1);
				String bbs_writer = rs.getString(7);
				BBSVO vo = new BBSVO(bbs_no, rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5),
						rs.getString(6), new MemberVO(bbs_writer, null, null, null), rs.getString(8));
				list.add(vo);
			}

		} finally {
			closeAll(rs, pstmt, con);
		}
		return list;
	}

	private boolean isRightForReview(String bbs_no) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// 지원한 게시물 가져오기
		String sql = "select count(*) from review where bbs_no=?";
		boolean flag = false;
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bbs_no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				// 이미 review에 insert가 된 경우
				if (rs.getInt(1) > 0)
					flag = true;
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return flag;
	}

	// endwork시 review테이블에 데이터 입력
	public void RightForReview(String bbs_no, String giveid, String getid) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			String sql = "insert into Review(bbs_no, giveReviewer, getReviewer) VALUES(?,?,?) ";
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bbs_no);
			pstmt.setString(2, giveid);
			pstmt.setString(3, getid);
			pstmt.executeUpdate();
		} finally {
			closeAll(pstmt, con);
		}

	}

	// endwork 종료가 됐는데도 고용주가 아무도 채용하지 않으면 apply 테이블에 hiredResult값을 수정해주는 메소드
	public void expiredApply(String bbs_no, String applyID) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			String sql = "update Review set hiredResult='EXPIRED' where bbs_no=? and id=? ";
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bbs_no);
			pstmt.setString(2, applyID);
			pstmt.executeUpdate();
		} finally {
			closeAll(pstmt, con);
		}

	}

	// 김수민 : 지원하기
	public void apply(String bbs_no, String id) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			String sql = "insert into apply(bbs_no,id) values(?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bbs_no);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
		} finally {
			closeAll(pstmt, con);
		}
	}

	// 강상훈: 지원했는지 여부
	public boolean IsApply(String bbs_no, String id) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean flag = false;
		String sql = "select * from apply where bbs_no=? and id=?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bbs_no);
			pstmt.setString(2, id);
			rs = pstmt.executeQuery();
			if (rs.next())
				flag = true;

		} finally {
			closeAll(pstmt, con);
		}
		return flag;
	}

	// 업무종료일 됐는지
	public boolean endWork(String bbs_no) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		boolean flag = false;
		// 현재날짜 - worktime 0보다 크거나 같으면 아직 일이 안끝남
		// -값 이면 일이 끝남
		try {
			String sql = "select (TO_CHAR(endworktime, 'YYYYMMDD')) - (to_char(sysdate,'yyyymmdd')) from board where bbs_no=?";
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setNString(1, bbs_no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
				if (result < 0) {
					flag = true;
				}
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
