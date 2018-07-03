package page;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import page.PageDTO;
import util.DatabaseUtil;

public class PageDAO {
	
	public int getCnt(String division){
		
		ArrayList<PageDTO> pageCnt = null;
		
		String SQL = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int totalPageCnt=0;
		System.out.println(division);
		try {

			SQL = "SELECT * FROM totalPage WHERE division=?";
			//SQL = "SELECT * FROM set1";
			System.out.println(SQL);
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, division);
			rs = pstmt.executeQuery();
			pageCnt = new ArrayList<PageDTO>();
			//SetDTO(int idx, String src, String fixed, String userList, String division)

			while(rs.next()) {
				totalPageCnt = rs.getInt("totalCnt");
				//System.out.println(rs.getInt(1) + " " + rs.getString(2) + " " + rs.getString(3) + " " + rs.getString(4) + " " + rs.getString(5));
				
			}

		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close();} catch(Exception e) { e.printStackTrace();}
			try { if(pstmt != null) pstmt.close();} catch(Exception e) { e.printStackTrace();}
			try { if(rs != null) rs.close();} catch(Exception e) { e.printStackTrace();}
		}	
		
		
		
		
		return totalPageCnt;
	}
}
