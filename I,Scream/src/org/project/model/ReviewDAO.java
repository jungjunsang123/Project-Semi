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
			sql.append(" group by getReviewer  having avg(stars) > 1 order by avgStars desc  ");
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
}
