package Product;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class DelServlet
 */
@WebServlet("/DelServlet")
public class DelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        	doPost(request,response);
     }


protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
	response.setContentType("text/html");
	        PrintWriter out = response.getWriter();
	         out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
	         out.println("<HTML>");
	          out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
	        out.println("  <BODY>");
	     
	     	    DataSource ds = null;
	    	    InitialContext ctxt = null;
	    	    Connection conn = null;
	    	    
	    	    
	              try {
	            	  ctxt = new InitialContext();

	        	      ds = ( DataSource ) ctxt.lookup("java:comp/env/jdbc/EmployeeDB");
	        	      conn = ds.getConnection();
	        	      
	        	      Integer pId= Integer.parseInt(request.getParameter("pid")) ;
	        	      
	        	      ProductDAO productDAO = new ProductDAO(conn);
    
     
	                if(productDAO.deleteProduct(pId)) {
	                    response.sendRedirect("./AllProduct.jsp");          
	                 }else{
	                   out.println("刪除失敗");
	                 }
	
	             } catch (SQLException | NamingException e) {
	  
	                  System.out.println("數據庫操作出錯" + e.getMessage());
	             }

	        out.println("  </BODY>");
	       out.println("</HTML>");
	       out.flush();
	        out.close();
	    }

}




