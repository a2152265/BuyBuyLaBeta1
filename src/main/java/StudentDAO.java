import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.sql.*;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Response;

import mvc.bean.LoginOneAccount;
import mvc.bean.MemberUiBean;
import mvc.bean.MemberUiDisplayBean;
import mvc.bean.StudentBean;
import mvc.bean.loginBean;


public class StudentDAO {
	private Connection conn;

//	  //建構子
//	  public StudentDAO(Connection conn) {
//			this.conn = conn;
//	  }
//
//	  //新增學生資料
//	  public boolean insertStudent(StudentBean studentData) {
//	    try {
//	    	
//	    	String compareEmail=null;
//			String userEmail=studentData.getUserEmail();
//	    	String sqlSearchString="select"+" UserEmail "+"from memberInformation";
//	    	System.out.println("測試抓回DATA="+sqlSearchString);
//	    	
//	    	
//	    	
//	    	System.out.println("getUserEmail = "+studentData.getUserEmail());
//	      String sqlString = "insert into memberInformation values('"
//		                  	   	+studentData.getUserEmail()+"','"
//			                    +studentData.getUserPhone()+"','"
//	                            + studentData.getUserPwd()+"')";
////	                            + studentData.getGender()+"','"
////	                            + studentData.getVec()+"')";
//	                            
//	                           
//	      Statement stmt = conn.createStatement();
//	      System.out.println(sqlString); //印出SQL指令
//	      //看insert幾筆
//		  int updatecount = stmt.executeUpdate(sqlString);
////		  compareEmail=stmt.executeQuery(sqlSearchString);  //查詢測試
////		  System.out.println("compareEmail = "+compareEmail);
//		  
//		  PreparedStatement prepstate=conn.prepareStatement(sqlSearchString);
//		  
//		  
//		  
//	      stmt.close();
//	      if (updatecount >= 1) {
//	    	  System.out.println("新增會員資料成功");
//	    	  return true;  //成功
//	    	  
//	      }
//	      else                  return false;  //失敗
//		  } catch (Exception e) {
//		    System.err.println("新增會員資料時發生錯誤拉:" + e);
//			return false;
//	    }
//	  }
//	  
	  
	// 創連線
		public void createConn() throws Exception {
			
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

			String urlStr = "jdbc:sqlserver://localhost:1433;databaseName=BuyBuy;user=sa;password=password";

			this.conn = DriverManager.getConnection(urlStr);

			boolean status = !conn.isClosed();

			if (status) {
				System.out.println("==========================");
				System.out.println("SQL連線開始!!");
			}
		}
		
		// 關閉連線 connection
		public void closeConn() throws SQLException {
			if (conn != null) {
				conn.close();
				System.out.println("SQL關閉連線!");
				System.out.println("==========================");
			}
		}
		
		// 新增資料的方法
		public void addMember(StudentBean m) throws SQLException {
			String sqlStr = "Insert into membershipInformation(userEmail, userPhone, userPwd)" + "values(?,?,?)";
			PreparedStatement preState = conn.prepareStatement(sqlStr);

			preState.setString(2, m.getUserEmail());
			preState.setString(1, m.getUserPhone());
			preState.setString(3, m.getUserPwd());
			
			preState.execute();
			
			

			preState.close();
		}
		
		// 登入會員的方法
			public MemberUiDisplayBean loginMember(loginBean m) throws SQLException, IOException {		
				boolean loginCheck=false;
					String sqlStr = "SELECT *　FROM membershipInformation　WHERE (userEmail=? AND userPwd=?)";					
					PreparedStatement preState = conn.prepareStatement(sqlStr);
					preState.setString(1, m.getEmailLogin());
					preState.setString(2, m.getPwdLogin());				
					ResultSet rs = preState.executeQuery();
					int count=0;
					System.out.println("rs="+rs);
					loginBean mm = null;
					int count1=0;
					MemberUiDisplayBean memberUiDisplayBeann=new MemberUiDisplayBean();
					while (rs.next()) {						
						count1++;
						mm = new loginBean();
						mm.setEmailLogin(rs.getString("userEmail"));
						mm.setPwdLogin(rs.getString("userPwd"));	
						mm.setPwdLogin(rs.getString("userPhone"));	
						mm.setPwdLogin(rs.getString("userName"));	
						mm.setPwdLogin(rs.getString("userGender"));	
						System.out.println("-----------------------------------");
						System.out.println("資料列 = "+count1);

						System.out.println("    帳號 = "+rs.getString("userEmail"));
						System.out.println("    密碼 = "+rs.getString("userPwd"));
						System.out.println("    姓名 = "+rs.getString("userName"));
						System.out.println("    電話 = "+rs.getString("userPhone"));
						System.out.println("    性別 = "+rs.getString("userGender"));
						System.out.println("-----------------------------------");
						
						System.out.println("rs.getString(\"userEmail\")  使用者登入帳號= "+rs.getString("userEmail"));
						System.out.println("m.getEmailLogin()  SQL帳號= "+m.getEmailLogin());
						System.out.println("rs.getString(\"userPwd\")  使用者登入密碼= "+rs.getString("userPwd"));
						System.out.println("m.getPwdLogin()  SQL密碼= "+m.getPwdLogin());
						
						//MemberUiDisplayBean 全部包成一個bean(含check)
						memberUiDisplayBeann.setUiEmail(rs.getString("userEmail"));
						memberUiDisplayBeann.setUiName(rs.getString("userName"));
						memberUiDisplayBeann.setUiPhone(rs.getString("userPhone"));
						memberUiDisplayBeann.setUiGender(rs.getString("userGender"));
						memberUiDisplayBeann.setCheck(loginCheck);			

						System.out.println("count1內"+count1);
						
					}	
					System.out.println("count1外"+count1);
					if(count1!=0) {
						System.out.println("登入成功!!!!!!");
						memberUiDisplayBeann.setCheck(true);
//						
				    	 rs.close();
					preState.close();
					loginCheck=true;
					System.out.println("name bean="+memberUiDisplayBeann.getUiName());
						return memberUiDisplayBeann;
					}else {
						System.out.println("登入失敗!");
//						
				    	 rs.close();
					preState.close();
					loginCheck=false;
						return memberUiDisplayBeann;
					}
					
//					return false;		
//					if(count1==0) {
//						System.out.println("登入失敗");
////						 URL url = new URL(https://manage.iiiedu.org.tw/api/class/remoteAttendance?qrcode=eyJjbGFzc0lEIjoiSkpFRUlUVDIxMDYiLCJFbWFpbCI6ImEyMTUyMjY1QGdtYWlsLmNvbSIsIk5hbWUiOiLojorpgLjlro8iLCAiY3VzdG9tZXJTTiI6IjIwMDkxMzE2MTMzNSIsIklzTWVhdExlc3MiOiJOIn0.getEchoAllHeadersURL());
////					    HttpURLConnection connection = (HttpURLConnection) url.openConnection();
//						//希望可以重新載入夜面
//		
//						//導入網業			
////						request.getRequestDispatcher("/DisplayStudent.jsp").forward(request, response);
//				    	 rs.close();
//					preState.close();
//					loginCheck=false;
//						return loginCheck;
//					}
//					return loginCheck;									
				}
				
				// 修改會員資料的方法
				public void rewriteMember(MemberUiBean m) throws SQLException {
//					Update membershipInformation Set userPhone='yy',userName='yy',userGender='yy'where userEmail='y'

					String sqlStr =  "Update membershipInformation Set userPhone=?,userName=?,userGender=?" + " where userEmail=?";		
							
//					String sqlStr =  "Update membershipInformation Set userPhone=? " + "where stock_symbol=? and stock_date=?";
					
					PreparedStatement preState = conn.prepareStatement(sqlStr);
					System.out.println("sqlStr1"+sqlStr);

					preState.setString(2, m.getUiName());
			
					preState.setString(4, m.getUiPhone());
					preState.setString(1, m.getUiGender());
					preState.setString(3, m.getUiEmail());
					System.out.println("getUiName="+m.getUiName());
					System.out.println("getUiPhone="+m.getUiPhone());
					System.out.println("getUiGender="+m.getUiGender());
					System.out.println("getUiEmail="+m.getUiEmail());
					System.out.println("======================");
					System.out.println("sqlStr11"+sqlStr);
					
					preState.execute();
					System.out.println("sqlStr111"+sqlStr);

					preState.close();
					System.out.println("更新會員資料完畢");
				}
				
				//deleteMember
				// 刪除會員資料的方法
				public void deleteMember(String m) throws SQLException {
					
					String sqlStr = "Delete from membershipInformation where userEmail=?";
					PreparedStatement preState = conn.prepareStatement(sqlStr);
					preState.setString(1, m);
									
					
					
					System.out.println("getEmailLogin="+m);
					System.out.println("======================");
					System.out.println("sqlStr11"+sqlStr);
					
					preState.execute();
					System.out.println("sqlStr111"+sqlStr);

					preState.close();
					System.out.println("刪除會員資料完畢");
				}


}
