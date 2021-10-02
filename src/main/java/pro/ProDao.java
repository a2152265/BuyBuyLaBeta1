package pro;

import java.sql.*;


public class ProDao {
	  private Connection conn;
	  public ProDao(Connection conn) {
			this.conn = conn;
	  }
	  
	  // 查詢商品
	  public boolean queryByProductName(String productname) {
		  try {
			  String sqlString = "select GrouponProduct where productname like '%"+productname+"%' ";
			  Statement stmt = conn.createStatement();
			  stmt.executeUpdate(sqlString);
				  return true;
		  } catch (Exception e) {
			  System.err.println("查詢資料時發生錯誤: "+ e);
			  return false;
		  }
	  }
	  
	  // 新增商品資料
	  public boolean insertForm(ProBean ProData) {
	    try {
	      String sqlString = "insert into GrouponProduct values('"
		                  	   	+ProData.getLeader()+"','"
			                    +ProData.getProductName()+"','"
			                    +ProData.getQuantity()+"','"
	                            + ProData.getPrice()+"','"
	                            + ProData.getDiscount()+"','"
	    	                    + ProData.getNewprice()+"','"
	    	                    + ProData.getDate()+"','"
	    	                    + ProData.getDeadline()+"','"
	    	                    + "F')"; // 成團狀態
	      Statement stmt = conn.createStatement();
		  stmt.executeUpdate(sqlString);
	      stmt.close();
	      return true;
		  } catch (Exception e) {
		    System.err.println("新增資料時發生錯誤:" + e);
			return false;
	    }
	  }
	  
	  // 刪除商品
	  public boolean deleteData(String productid) {
		  try {
			  String sqlString = "delete GrouponProduct where id = '"+productid+"' ";
			  Statement stmt = conn.createStatement();
			  stmt.executeUpdate(sqlString);
			  stmt.close();
			  return true;
		  } catch (Exception e) {
			  System.err.println("刪除資料時發生錯誤: "+ e);
			  return false;
		  }
	  }
	  
	  // 修改商品
	  public boolean updata(String leader, String productName,int quantity, int price,int discount,int newprice,String date,String deadline,String oldid) {
	    try {
	      String sqlString = "Update GrouponProduct set leader=?,productname=?"
	      		+ ",quantity=?,price=?,discount=?,newprice=?,date=?,deadline=? where id=?";
			  
				PreparedStatement preState = conn.prepareStatement(sqlString);
				preState.setString(1, leader);
				preState.setString(2, productName);
				preState.setInt(3, quantity);
				preState.setInt(4, price);
				preState.setInt(5, discount);
				preState.setInt(6, newprice);
				preState.setString(7, date);
				preState.setString(8, deadline);
				preState.setString(9, oldid);
				preState.execute();
				preState.close();
				
				return true;
		  } catch (Exception e) {
		    System.err.println("修改資料時發生錯誤: "+ e);
			  return false;
		  }

	  }
	
}
