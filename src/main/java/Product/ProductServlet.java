package Product;


import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;


import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;




/**
 * Servlet implementation class ProductServlet
 */

@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
 private static final long serialVersionUID = 1L;
       
  private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
  private static final String CHARSET_CODE = "UTF-8";

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    
 /**
  * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
  */

 /**
  * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
  */
    
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  // TODO Auto-generated method stub
     request.setCharacterEncoding(CHARSET_CODE);
     response.setContentType(CONTENT_TYPE);

     // To prevent caching 
    response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
    response.setHeader("Pragma","no-cache"); // HTTP 1.0
    response.setDateHeader ("Expires", -1); // Prevents caching at the proxy server

     
    if (request.getParameter("submit")!=null)
      gotoSubmitProcess(request, response);
    else if (request.getParameter("confirm")!=null)
      gotoConfirmProcess(request, response);}

 
 public void gotoSubmitProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
   {
   String proName;
   String pcID;
   int proPrice;
   int proAccount;
   String proInfo;
   int proId;
   String proImg;

  
   
 
   proId=Integer.parseInt(request.getParameter("proId"));
   proName = request.getParameter("proName").trim();
   pcID = request.getParameter("Categories");
   proPrice = Integer.parseInt(request.getParameter("proPrice"));
   proAccount = Integer.parseInt(request.getParameter("proCnt"));
   proInfo = request.getParameter("proInfo").trim();
   proImg = request.getParameter("proImg").trim();
   
   
     ProductBean  pro_bean =  new ProductBean(proId,proName,pcID,proPrice,proAccount,proInfo,proImg);
     request.getSession(true).setAttribute("pro_bean",pro_bean);
     request.getRequestDispatcher("/DisplayPro.jsp").forward(request,response);
     
     
     
   }

   public void gotoConfirmProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
   {

     DataSource ds = null;
     InitialContext ctxt = null;
     Connection conn = null;
     
     try {
      
       //建立Context Object,連到JNDI Server 
       ctxt = new InitialContext();

       //使用JNDI API找到DataSource
       ds = ( DataSource ) ctxt.lookup("java:comp/env/jdbc/EmployeeDB");
       //ds = ( DataSource ) ctxt.lookup("jdbc/OracleXE");
       //向DataSource要Connection
       conn = ds.getConnection();

       //建立Database Access Object,負責Table的Access
       ProductDAO productDAO = new ProductDAO(conn);
       ProductBean proData = (ProductBean)request.getSession(true).getAttribute("pro_bean");
       if (productDAO.insertProduct(proData))
         {
           System.out.println("Get some SQL commands done!");
           request.getSession(true).invalidate();
           request.getRequestDispatcher("/Thanks.jsp").forward(request,response);
         }
     } catch (NamingException ne) {
       System.out.println("Naming Service Lookup Exception");  
     } catch (SQLException e) {
       System.out.println("Database Connection Error"); 
     } finally {
       try {
         if (conn != null) conn.close();
       } catch (Exception e) {
         System.out.println("Connection Pool Error!");
       }
     }
   }
  
   
 }