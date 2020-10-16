package org.project.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
}
