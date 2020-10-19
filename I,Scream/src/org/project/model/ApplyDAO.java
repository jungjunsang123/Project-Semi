package org.project.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class ApplyDAO {
	private static ApplyDAO dao=new ApplyDAO();	
	private DataSource dataSource;
	private ApplyDAO(){
		dataSource=DataSourceManager.getInstance().getDataSource();
	}
	public static ApplyDAO getInstance(){
		return dao;
	}
	public Connection getConnection() throws SQLException{
		return dataSource.getConnection();
	}
	
	//고용주 게시물에서 지원자 출력
	public ArrayList<MemberVO> listApplyer(String bbs_no) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		//게시물에 대해서 지원한 사람의 아이디와 평점을 가져온다.
		String sql = "select a.id,m.name,m.avgstars from member m,(select * from apply where bbs_no=?) a where a.id=m.id";
		try {
			 con = getConnection();
			 pstmt = con.prepareStatement(sql);
			 pstmt.setString(1,bbs_no);
			 System.out.println(bbs_no);
			 rs = pstmt.executeQuery();
			 while(rs.next()){
				 System.out.println("하잇");
				 list.add(new MemberVO(rs.getString(1), rs.getString(2), rs.getFloat(3)));
			 }
		} finally {
			closeAll(rs, pstmt, con);
		}
		return list;
	}
	
	//채용 처리 메소드
	public void recruit(String bbs_no, String applyID) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		//채용된 사람 및 안된 사람에 대한 db 데이터 변경
		//id가 채용된 지원자인경우에만 채용결과에 yes를 넣고 아니면 no라고 입력
		String sql = "update apply set hiredResult = CASE when id=? then 'YES' ELSE 'FAIL' end where bbs_no=?";
		try {
			 con = getConnection();
			 pstmt = con.prepareStatement(sql);
			 pstmt.setString(1,applyID);
			 pstmt.setString(2,bbs_no);
			 pstmt.execute();
		} finally {
			closeAll(pstmt, con);
		}
	}
	//지원한 게시물 출력 리스트(채용된것과 기간지난건 제외)
	public ArrayList<BBSVO> findApplyList(String id) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<BBSVO> list = new ArrayList<BBSVO>();
		//지원한 게시물 가져오기
		String sql="select b.bbs_no,b.title,b.context,b.hits,b.POSTEDDATE,b.category,b.endWORKTIME-SYSDATE,b.writer,a.hiredResult from board b, (select * from apply where id=?) a where b.bbs_no=a.bbs_no";
		try {
			 con = getConnection();
			 pstmt = con.prepareStatement(sql.toString());
			 pstmt.setString(1,id);
			 rs = pstmt.executeQuery();
			 
			 while(rs.next()) {
				 if(rs.getInt(7)>0) {
					 list.add(new BBSVO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6),new MemberVO(rs.getString(8), null, null),rs.getString(9)));
				 }
			 }
			 
		} finally {
			closeAll(rs, pstmt, con);
		}
		return list;
	}
	//김수민 : 지원하기
		public void apply(String bbs_no,String id) throws SQLException {
			Connection con=null;
			PreparedStatement pstmt=null;
			try {
				con=getConnection();
				String sql="insert into apply(bbs_no,id) values(?,?)";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1,bbs_no);
				pstmt.setString(2,id);
				pstmt.executeUpdate();
			} finally {
				closeAll(pstmt, con);
			}
		}
	//강상훈: 지원했는지 여부
		public boolean IsApply(String bbs_no,String id) throws SQLException {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs = null;
			boolean flag = false;
			String sql="select * from apply where bbs_no=? and id=?";
			try {
				con=getConnection();
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1,bbs_no);
				pstmt.setString(2,id);
				rs=pstmt.executeQuery();
				if(rs.next())
					flag=true;
					
			} finally {
				closeAll(pstmt, con);
			}
			return flag;
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
