

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import mvc.bean.CampaignBean;

/**
 * Servlet implementation class QueryServlet
 */
@WebServlet("/QueryServlet")
public class QueryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
	private static final String CHARSET_CODE = "UTF-8";

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}
   
    /**
     * @see HttpServlet#HttpServlet()
     */
   

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding(CHARSET_CODE);
		response.setContentType(CONTENT_TYPE);

		response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0
		response.setDateHeader("Expires", -1); // Prevents caching at the proxy server

		if (request.getParameter("selectId") != null)
			gotoSelectIdProcess(request, response);
		else if (request.getParameter("selectAll") != null)
			gotoSelectAllProcess(request, response);
		else if (request.getParameter("return") != null)
			 request.getRequestDispatcher("/main.html").forward(request, response);
		
	}
	public void gotoSelectIdProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		DataSource ds = null;
		InitialContext ctxt = null;
		Connection conn = null;

		try {
 
			// 建立Context Object,連到JNDI Server
			ctxt = new InitialContext();

			// 使用JNDI API找到DataSource
			ds = (DataSource) ctxt.lookup("java:comp/env/jdbc/EmployeeDB");
			// ds = ( DataSource ) ctxt.lookup("jdbc/OracleXE");
			// 向DataSource要Connection
			conn = ds.getConnection();
			
			
			String id;
			
			id=request.getParameter("id").trim();
		
			CampaignDAO registerDAO = new CampaignDAO(conn);
			if(registerDAO.selectId(Integer.valueOf(id))==null) {
				request.getRequestDispatcher("/searchfailure.jsp").forward(request, response);
			}
			CampaignBean reg = registerDAO.selectId(Integer.valueOf(id));
			System.out.println("Get some SQL commands done!");
			HttpSession session = request.getSession(true);
			session.setAttribute("reg", reg);
			String base64 = Base64.getEncoder().encodeToString(reg.getImg());
			session.setAttribute("base64Img", base64);
     		request.getRequestDispatcher("/reviseresult.jsp").forward(request, response);
		
			
			
			
			
		
				System.out.println("Get some SQL commands done!");
				request.getSession(true).invalidate();
//				request.getRequestDispatcher("/Thanks.jsp").forward(request, response);
				response.getWriter().println("報名成功");
				
			
		} catch (NamingException ne) {
			System.out.println("Naming Service Lookup Exception");
		} catch (SQLException e) {
			System.out.println("Database Connection Error");
		} finally {
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				System.out.println("Connection Pool Error!");
			}
		}
		}
		
	
	
	public void gotoSelectAllProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		DataSource ds = null;
		InitialContext ctxt = null;
		Connection conn = null;

		try {
 
			// 建立Context Object,連到JNDI Server
			ctxt = new InitialContext();

			// 使用JNDI API找到DataSource
			ds = (DataSource) ctxt.lookup("java:comp/env/jdbc/EmployeeDB");
			// ds = ( DataSource ) ctxt.lookup("jdbc/OracleXE");
			// 向DataSource要Connection
			conn = ds.getConnection();

			// 建立Database Access Object,負責Table的Access
			CampaignDAO registerDAO = new CampaignDAO(conn);
//			if(registerDAO.selectAll()==null) {
//				throw  Servletexception("");
//				}
//			else {
			ArrayList<CampaignBean> list = registerDAO.selectAll();
			System.out.println("Get some SQL commands done!");
			HttpSession session = request.getSession(true);
			session.setAttribute("list", list);
			
			ArrayList<String> imgList = new ArrayList<String>(); 
			for (CampaignBean camp : list) {
				String base64 = Base64.getEncoder().encodeToString(camp.getImg());
				imgList.add(base64);
			}
//			imgList.size();
//			System.out.println(imgList.get(0));
			session.setAttribute("imgList", imgList);				
			
			request.getRequestDispatcher("/reviseresultAll.jsp").forward(request, response);
//         	}
//			}
		} catch (NamingException ne) {
			System.out.println("Naming Service Lookup Exception");
		} catch (SQLException e) {
			System.out.println("Database Connection Error");
		} finally {
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				System.out.println("Connection Pool Error!");
			}
		}
		}
}
