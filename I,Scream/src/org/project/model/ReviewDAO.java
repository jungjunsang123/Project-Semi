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
	public ArrayList<MemberVO> getAVGStar() throws SQLException {
		Connection con= null;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		ArrayList<MemberVO> list =new ArrayList<MemberVO>();
		MemberVO vo;
		try {
			String sql="select getreviewer, avg(stars) as avgStars from review group by getReviewer having avg(stars) > 2 order by avgStars desc";
			// 평균 별점이 2점이상 인사람 뽑아옴
			con = getConnection();
			pstmt = con.prepareStatement(sql);
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
