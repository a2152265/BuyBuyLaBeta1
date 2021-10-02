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
import javax.sql.DataSource;

/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
 private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServlet() {
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
              //獲取edit 傳遞的字段
     
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
              
              
                 String proId=request.getParameter("proId");
                 String proName=request.getParameter("proName");
                  String Categories=request.getParameter("Categories");
                  String proPrice=request.getParameter("proPrice");
                  String proCnt=request.getParameter("proCnt");
                  String proInfo=request.getParameter("proInfo");
                  String proImg=request.getParameter("proImg");

                  ProductBean p=new ProductBean();
                   p.setProId(Integer.parseInt(proId));
                   p.setProName(proName);
                   p.setPcID(Categories);
                   p.setProPrice(Integer.parseInt(proPrice));
                   p.setProAccount(Integer.parseInt(proCnt));
                   p.setpInfo(proInfo);
                   p.setProImage(proImg);
                                 
                             //調用方法
                               ProductDAO pdao= new ProductDAO(conn);
                                 int n=pdao.updateProduct(p);
                                   if(n>0) {
                   //成功就調用查詢方法  看修改完后的
                                       response.sendRedirect("./AllProduct.jsp");
                                   }
                                   else
                                   {
                                    out.println("修改失敗");
                                   }
                           
                           
                           
                           out.println("  </BODY>");
                          out.println("</HTML>");
                          out.flush();
                          out.close();
                      }
 }