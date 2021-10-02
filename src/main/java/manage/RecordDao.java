package manage;

import java.awt.Desktop;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.zaxxer.hikari.HikariDataSource;

import manage.Record;

public class RecordDao {

	private Connection conn;
	private HikariUtil connPool = new HikariUtil();

	public RecordDao(Connection conn2) {
		// TODO Auto-generated constructor stub
	}

	// 連線
	public void createConn() throws Exception {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

		   String urlStr = "jdbc:sqlserver:/MSI\\SQLEXPRESS:1433;databaseName=BuyBuy;user=sa;password=password";

		   this.conn = DriverManager.getConnection(urlStr);

		   boolean status = !conn.isClosed();

		   if (status) {
		    System.out.println("==========================");
		    System.out.println("SQL連線開始!!");
		   }
//		conn = ds.getConnection();
//
//		boolean status = !conn.isClosed();
//
//		if (status) {
//			System.out.println("Open Connection!!");
//		}

	}

	// 關連線
	public void closeConn() throws SQLException {
		if (conn != null) {
			conn.close();
			System.out.println("Close Connection!");
		}
	}

	  //新增學生資料
	  public boolean insertRecord(Record record) {
	    try {
	      String sqlString = "insert into record values('"
		                  	   	+record.getRecord_id()+"','"
		                  	   	+ record.getPID()+"','"
			                    +record.getP_name()+"','"	                            
	                            + record.getP_price()+"','"
	                          //  + record.getBuy_time()+"','" 
	                            + record.getPcount()+"')";                          
	                          //  + record.getUserEmail()+ "')";
	      PreparedStatement preState = conn.prepareStatement(sqlString);        
	      Statement stmt = conn.createStatement();
	      System.out.println(sqlString);
		  int updatecount = stmt.executeUpdate(sqlString);
	      stmt.close();
	      if (updatecount >= 1) return true;
	      else                  return false;
		  } catch (Exception e) {
		    System.err.println("新增學生資料時發生錯誤:" + e);
		    e.printStackTrace();
			return false;
	    }
	  }




	


}
