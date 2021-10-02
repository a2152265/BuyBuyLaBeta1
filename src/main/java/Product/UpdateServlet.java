package Product;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

/**
 * Servlet implementation class UpdateGetUserServlet
 */
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
 private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

 /**
  * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
  */
 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  doPost(request, response);
 }

 /**
  * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
  */
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html");
             PrintWriter out = response.getWriter();
            out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
             out.println("<HTML>");
            out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
             out.println("  <BODY>");
             
             HttpSession  session=request.getSession(true);
             String pid=request.getParameter("pid");
                     int id=Integer.parseInt(pid);
                     
                  DataSource ds = null;
            InitialContext ctxt = null;
            Connection conn = null;
            
                     try {
                   ctxt = new InitialContext();

                   ds = ( DataSource ) ctxt.lookup("java:comp/env/jdbc/EmployeeDB");
                   conn = ds.getConnection();
                     }catch (Exception e) {
       // TODO: handle exception
      }
                     
                    ProductDAO productDAO =new ProductDAO(conn);
                    ProductBean p= productDAO.selectAllProduct(id);
                   
                              //傳遞給session 對象
                       session.setAttribute("Pro_Bean", p);
                       response.sendRedirect("./edit.jsp");
                     
                    out.println("  </BODY>");
                     out.println("</HTML>");
                     out.flush();
                     out.close();
                }
             
 }