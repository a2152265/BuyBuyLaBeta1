// DAO: Database Access Object
// �M�d�PDept Table���s�W,�ק�,�R���P�d��

import java.sql.*;
import java.util.ArrayList;

import mvc.bean.CampaignBean;

public class CampaignDAO {

	private Connection conn;

	// 建構子
	public CampaignDAO(Connection conn) {
		this.conn = conn;
	}
	
	
	
	 public boolean deleteAll() {
		    try {
		      int deletecount=0;
		      String sqlStr = "Truncate table campaign";
		      PreparedStatement stmt = conn.prepareStatement(sqlStr);
			
			  deletecount = stmt.executeUpdate();
			  stmt.close();
			  System.err.println(deletecount);
		      if (deletecount ==-1) return true;
				  else                  return false;
			  } catch (Exception e) {
			    System.err.println("刪除部門時發生錯誤: "+ e);
				  return false;
			  }
		  }
	
	
	 public boolean deleteId(int id) {
		    try {
		      int deletecount=0;
		      String sqlStr = "delete from campaign where id = ?";
		      PreparedStatement stmt = conn.prepareStatement(sqlStr);
			  stmt.setInt(1, id);
			  deletecount = stmt.executeUpdate();
			  stmt.close();
		      if (deletecount >= 1) return true;
				  else                  return false;
			  } catch (Exception e) {
			    System.err.println("刪除部門時發生錯誤: "+ e);
				  return false;
			  }
		  }
	
	
	 public boolean modify(CampaignBean registerData) {
	    try {
	    	
	    String sqlStr = "Update campaign set img=?,url=?,name=?,description=?,note=? where id = ?";
		PreparedStatement stmt = conn.prepareStatement(sqlStr);
		int updatecount=0;
		stmt.setBytes(1, registerData.getImg());
		stmt.setString(2, registerData.getUrl());
		stmt.setString(3, registerData.getName());
		stmt.setString(4, registerData.getDescription());
		stmt.setString(5, registerData.getNote());
		stmt.setInt(6, registerData.getId());
	
		updatecount = stmt.executeUpdate();
		System.out.println(updatecount);
		
		stmt.close();
		if (updatecount >= 1)
			return true;
		else
			return false;
	} catch (Exception e) {
		System.err.println("新增資料時發生錯誤:" + e);
		return false;
	}
	  }
	
	
	
	
	
	
	public ArrayList<CampaignBean> selectAll(){
		ArrayList<CampaignBean> list=null;
		CampaignBean cam=null;
		int updatecount=0;
		try {
		String sqlStr = "select * from campaign";
		PreparedStatement stmt = conn.prepareStatement(sqlStr);
		ResultSet rs = stmt.executeQuery();
//		System.out.println(rs);
//		updatecount = stmt.executeUpdate();
//		System.out.println(updatecount);
//		if(rs==null) {
//			return null;
//		}
		list=new ArrayList<>();
		while(rs.next()) {
			cam=new CampaignBean();
			cam.setId(rs.getInt("id"));
			cam.setImg(rs.getBytes("img"));
			cam.setUrl(rs.getString("url"));
			cam.setName(rs.getString("name"));
			cam.setDescription(rs.getString("description"));
			cam.setNote(rs.getString("note"));
			list.add(cam);
		}
//		System.out.println(list);
		
		
		rs.close();
		stmt.close();
		
		} catch (Exception e) {
			System.err.println("新增資料時發生錯誤:" + e);
		}
		return list;
	}
	

	// 查詢ID
	public CampaignBean selectId(int id) {
		CampaignBean cam=null;
		try {
		
		String sqlStr = "select * from campaign where id=?";
		PreparedStatement stmt = conn.prepareStatement(sqlStr);
		stmt.setInt(1,id);
		ResultSet rs = stmt.executeQuery();
		if(rs==null) {
			return null;
		}
		while(rs.next()) {
			cam=new CampaignBean();
			cam.setId(rs.getInt("id"));
			cam.setImg(rs.getBytes("img"));
			cam.setUrl(rs.getString("url"));
			cam.setName(rs.getString("name"));
			cam.setDescription(rs.getString("description"));
			cam.setNote(rs.getString("note"));
		}
		rs.close();
		stmt.close();
		
		} catch (Exception e) {
			System.err.println("新增資料時發生錯誤:" + e);
		}
		return cam;
	}
		
	
	// 新增資料
	public boolean insertData(CampaignBean registerData) {
		try {
			String sqlString = "insert into campaign values(?,?,?,?,?)";
			PreparedStatement stmt = conn.prepareStatement(sqlString);
			int updatecount = 0;
			

			System.out.println(sqlString);
			
			stmt.setBytes(1, registerData.getImg());
			stmt.setString(2, registerData.getUrl());
			stmt.setString(3, registerData.getName());
			stmt.setString(4, registerData.getDescription());
			stmt.setString(5, registerData.getNote());
			updatecount = stmt.executeUpdate();

			stmt.close();
			if (updatecount >= 1)
				return true;
			else
				return false;
		} catch (Exception e) {
			System.err.println("新增資料時發生錯誤:" + e);
			return false;
		}

	}
}