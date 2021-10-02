package Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;




public class ProductDAO {

   private Connection conn;


   public ProductDAO(Connection conn) {
   this.conn = conn;
   }

   public boolean insertProduct(ProductBean productData) {
      try {
         String sqlString = "insert into PRODUCT (PID,P_Name,PC_ID,P_price,P_cnt,P_info,P_img)values('"
          +productData.getProId()+"','"
                        +productData.getProName()+"','"
                      +productData.getPcID() +"','"
                          +productData.getProPrice() +"','"
                          +productData.getProAccount() +"','"
                         +productData.getproInfo() +"','"
                          +productData.getProImage() +"')" ;

                             
        Statement stmt = conn.createStatement();
        System.out.println(sqlString);
     int updatecount = stmt.executeUpdate(sqlString);
        stmt.close();
        if (updatecount >= 1) return true;
        else                  return false;
     } catch (Exception e) {
       System.err.println("" + e);
    return false;
      }
    }

      
   
   public boolean deleteProduct(int pId) {
     int i=0;
      try {
        String sqlString = "delete from PRODUCT where PID=?";
        PreparedStatement pre= conn.prepareStatement(sqlString);
           pre.setInt(1,pId);         
           
           i=pre.executeUpdate();
        
           pre.close();
           conn.close();
  
    }catch (Exception e) {
   // TODO: handle exception
  }
      if(i>0) {
       return true;
      }else {
    
       return false;
   }
      
      
    }
   
   public ProductBean selectAllProduct(int pId) {
    ProductBean p=new ProductBean();
          try {
  
         
               PreparedStatement pre= conn.prepareStatement("select PID,P_Name,PC_ID,P_price,P_cnt,P_info,P_img from PRODUCT where PID=?");
               pre.setInt(1, pId);
               ResultSet rs = pre.executeQuery();
              
               // 通過循環，從結果集對象中取得數據
              while (rs.next()) {
                int pid = rs.getInt("PID");
                   String proName = rs.getString("P_Name"); // 取得字符類型的字段username的值，
                   int proPrice = rs.getInt("P_price");
                   int proAccount=rs.getInt("P_cnt");
                   String pInfo=rs.getString("P_info");
                   String pcId=rs.getString("PC_ID");
                   String pcImg=rs.getString("P_img");

//                   String address=rs.getString("address");
                  
                 p.setProId(pid);
                 p.setProName(proName);
                 p.setProPrice(proPrice);
                 p.setProAccount(proAccount);
                 p.setpInfo(pInfo);
                 p.setPcID(pcId);
                 p.setProImage(pcImg);
                 
                
                }
            } catch (SQLException e) {
    
                System.out.println("數據庫操作出錯" + e.getMessage());
            }
            return p;
        }
 
   public int updateProduct(ProductBean p){
    
    int n=0;
         
    try {  
     // 執行SQL語句，得到結果集，結果集放到ResultSet對象中
     String sql="update PRODUCT set P_Name=?,PC_ID=?,P_price=?,P_cnt=?,P_info=?,P_img=? where PID=?";
     PreparedStatement prestate = conn.prepareStatement(sql);
     

     prestate.setString(1, p.getProName());
     prestate.setString(2, p.getPcID());
     prestate.setInt(3, p.getProPrice());
     prestate.setInt(4, p.getProAccount());
     prestate.setString(5, p.getproInfo());
     prestate.setString(6, p.getProImage());
     prestate.setInt(7, p.getProId());
     
     n=prestate.executeUpdate();
     
    }catch (SQLException e) {
    
                System.out.println("數據庫操作出錯" + e.getMessage());
            }
            return n;
        }

}