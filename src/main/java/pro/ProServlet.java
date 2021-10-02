package pro;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class proServlet
 */
@WebServlet("/ProServlet")
public class ProServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
	private static final String CHARSET_CODE = "UTF-8";

	/**
	 * @see Servlet#init(ServletConfig)
	 */

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding(CHARSET_CODE);
		response.setContentType(CONTENT_TYPE);
		
		if (request.getParameter("gSubmit") != null) { // 新增商品-提交
			addProduct(request, response);
		}else if (request.getParameter("confirm") != null) { // 資料確定-提交
			checkAdd(request, response);
		}else if(request.getParameter("seachbtn") != null) { // 首頁-搜尋
			query(request, response);
		}else if(request.getParameter("delete")!=null){  // 管理-刪除
			manageDelete(request,response);
		}else if(request.getParameter("query") != null) { // 管理-搜尋
			manageQuery(request, response);
		}else if(request.getParameter("updata") != null) { // 管理-修改
			manageUpdata(request, response);
		}else if(request.getParameter("updatabtn") != null) { // 修改確定
			manageCheckUpdata(request, response);
		}else if(request.getParameter("queryname")!=null) { // 模糊搜尋 商品名
			manageQueryName(request,response);
		}
	}

	public void addProduct(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String leader = request.getParameter("leader");
		String productName = request.getParameter("productName");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		int price = Integer.parseInt(request.getParameter("price"));
		int discount=Integer.parseInt(request.getParameter("discount"));
		int newprice=Integer.parseInt(request.getParameter("newprice"));
		String date = request.getParameter("date");
		String deadline = request.getParameter("deadline");
//		byte img =Byte.parseByte(request.getParameter("img"));

		ProBean add_form = new ProBean(leader,productName,quantity, price,discount,newprice,date,deadline);
		request.getSession(true).setAttribute("add_form", add_form);
		request.getRequestDispatcher("/check32.jsp").forward(request, response);
	}

	public void checkAdd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		DataSource ds = null;
		InitialContext ctxt = null;
		Connection conn = null;
		try {
			ctxt = new InitialContext();
			ds = (DataSource) ctxt.lookup("java:comp/env/jdbc/EmployeeDB");
			conn = ds.getConnection();
			ProDao ProDAO = new ProDao(conn);
			ProBean addData = (ProBean) request.getSession(true).getAttribute("add_form");
			if (ProDAO.insertForm(addData)) {
				request.getSession(true).invalidate();
				request.getRequestDispatcher("/Intelligence32.jsp").forward(request, response);
			}
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				System.out.println("Connection Fail");
			}
		}
	}
	
	// 頁面搜尋
	public void query(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			String seach =request.getParameter("seach");
			request.getSession(true).setAttribute("seach", seach);
		request.getRequestDispatcher("/Home-query.jsp").forward(request, response);
	}
	
	// 刪除商品
	public void manageDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DataSource ds = null;
		InitialContext ctxt = null;
		Connection conn = null;
		try {
			ctxt = new InitialContext();
			ds = (DataSource) ctxt.lookup("java:comp/env/jdbc/EmployeeDB");
			conn = ds.getConnection();
			ProDao ProDAO = new ProDao(conn);
			String productid =request.getParameter("productid");
			if (productid != "") {
				ProDAO.deleteData(productid);
				request.getRequestDispatcher("/Manage.jsp").forward(request, response);
			}else {
				request.getRequestDispatcher("/Manage.jsp").forward(request, response);
			}
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				System.out.println("Connection Fail");
			}
		}
	}
	
	// 管理頁面搜尋
	public void manageQuery(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String query =request.getParameter("productid");
		if (query != "") {
			request.getSession(true).setAttribute("query", query);
			request.getRequestDispatcher("/Manage-query.jsp").forward(request, response);	
		}else {
			request.getRequestDispatcher("/Manage.jsp").forward(request, response);
		}
	}
	
	// 管理頁面依商品名搜尋
	public void manageQueryName(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String queryname =request.getParameter("productname");
		if (queryname != "") {
			request.getSession(true).setAttribute("queryname", queryname);
			request.getRequestDispatcher("/Manage-queryname.jsp").forward(request, response);	
		}else {
			request.getRequestDispatcher("/Manage.jsp").forward(request, response);
		}
	}
	
	// 管理頁面修改
	public void manageUpdata(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
				String productid =request.getParameter("productid");
				if (productid != "") {
					request.getSession(true).setAttribute("productid", productid);
					request.getRequestDispatcher("/Manage-updata.jsp").forward(request, response);
				}else {
					request.getRequestDispatcher("/Manage.jsp").forward(request, response);
				}
	        }
	
	// 管理頁面修改
	public void manageCheckUpdata(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String leader = request.getParameter("leader");
		String productName = request.getParameter("productName");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		int price = Integer.parseInt(request.getParameter("price"));
		int discount=Integer.parseInt(request.getParameter("discount"));
		int newprice=Integer.parseInt(request.getParameter("newprice"));
		String date = request.getParameter("date");
		String deadline = request.getParameter("deadline");
		String oldid=request.getSession(true).getAttribute("productid").toString();
		
		DataSource ds = null;
		InitialContext ctxt = null;
		Connection conn = null;
		try {
			ctxt = new InitialContext();
			ds = (DataSource) ctxt.lookup("java:comp/env/jdbc/EmployeeDB");
			conn = ds.getConnection();
			ProDao ProDAO = new ProDao(conn);
			ProDAO.updata(leader,productName,quantity,price,discount,newprice,date,deadline,oldid);
			request.getRequestDispatcher("/Manage.jsp").forward(request, response);
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				System.out.println("Connection Fail");
			}
		}

}
	
	
	
	
	
}
