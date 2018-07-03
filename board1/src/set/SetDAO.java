package set;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;

import util.DatabaseUtil;

public class SetDAO {

	public ArrayList<SetDTO> getList(String selectName, int pageNumber){
		if(selectName.equals("")){
			selectName="test";
		}		
		ArrayList<SetDTO> setList = null;
		String SQL = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println(selectName);
		try {
			int first = pageNumber* 10;
			int second = pageNumber*10+11;
			SQL = "SELECT * FROM set1 WHERE division=? LIMIT " + first + ", " + second;
			//SQL = "SELECT * FROM set1";
			System.out.println(SQL);
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, selectName);
			rs = pstmt.executeQuery();
			setList = new ArrayList<SetDTO>();
			//SetDTO(int idx, String src, String fixed, String userList, String division)

			while(rs.next()) {
				
				//System.out.println(rs.getInt(1) + " " + rs.getString(2) + " " + rs.getString(3) + " " + rs.getString(4) + " " + rs.getString(5));
				SetDTO set = new SetDTO(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6),
						rs.getTimestamp(7),
						rs.getString(8)
						);
				setList.add(set);
			}

		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close();} catch(Exception e) { e.printStackTrace();}
			try { if(pstmt != null) pstmt.close();} catch(Exception e) { e.printStackTrace();}
			try { if(rs != null) rs.close();} catch(Exception e) { e.printStackTrace();}
		}
		return setList;
	}
	
	
	
	public int fix(int idx, String fixed, String userFix, String Name) {
		
		String SQL = "select * from set1 WHERE idx=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String Date = null;
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		System.out.println(userFix);
		Date = sdf.format(dt).toString();
 
		
		String userList = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
/*			if(rs.next()) {
				userList = rs.getString("userList");
				if(!userList.contains(Name)) {
					userList = userList + " | " + Name;
				}
				System.out.println(userList);
			}*/
			
			//try { if(conn != null) conn.close();} catch(Exception e) { e.printStackTrace();}
			try { if(pstmt != null) pstmt.close();} catch(Exception e) { e.printStackTrace();}
			try { if(rs != null) rs.close();} catch(Exception e) { e.printStackTrace();}
			
		
			SQL = "UPDATE set1 SET userfixed=?, userList=?, fixedTime=?, lastFixer=? WHERE idx=?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, fixed);
			pstmt.setString(2, userList);
			pstmt.setString(3, Date);
			pstmt.setString(4, Name);
			pstmt.setInt(5, idx);
			
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close();} catch(Exception e) { e.printStackTrace();}
			try { if(pstmt != null) pstmt.close();} catch(Exception e) { e.printStackTrace();}
			try { if(rs != null) rs.close();} catch(Exception e) { e.printStackTrace();}
		}
		
		return 1;
	}
}
