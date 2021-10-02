package manage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import manage.Record;
import user.UserDao;
import user.UserDaoFactory;

/**
 * Servlet implementation class RecordServlet
 */
@WebServlet("/RecordServlet")
public class RecordServlet extends HttpServlet {
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding(CHARSET_CODE);
		response.setContentType(CONTENT_TYPE);

//		// To prevent caching
//		response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
//		response.setHeader("Pragma", "no-cache"); // HTTP 1.0
//		response.setDateHeader("Expires", -1); // Prevents caching at the proxy server

		if (request.getParameter("confirm") != null)
			gotoConfirmProcess(request, response);
	}

	public void gotoConfirmProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int ccnt=1;
		int record_id;
		String[] PID;
		String[] p_name;
		String[] p_price;
		String[] pcount ;
		String ppid=null;
		// 把報名表資料都抓下來存成string (.trim=去空白)
		record_id=ccnt;
		System.out.println("Get some SQL commands done勾勾畫面0!");
//		
//		ppid = (String) request.getAttribute("pid");
//		System.out.println("ppid="+ppid);
//		
//		for(int i =0;i<5;i++) {
//			PID = request.getParameterValues("PID");
//			p_name = request.getParameterValues("pName");
//			p_price = request.getParameterValues("price");
//			pcount = request.getParameterValues("pCount");
//			System.out.println("PID="+PID);
//			System.out.println("p_name="+p_name);
//			System.out.println("p_price="+p_price);
//			System.out.println("pcount="+pcount);
//			System.out.println("Get some SQL commands done勾勾畫面!00");
//			
//			
//			Record reg_student = new Record(record_id,PID,p_name,p_price,pcount);
//			request.getSession(true).setAttribute("reg_student", reg_student);
//			
//			Record uiEmaill=  (Record)request.getSession(true).getAttribute("reg_student");
//			   String[] uiEmail =uiEmaill.getPID();
//			   System.out.println("uiEmail="+uiEmail);
//		}
	
//		int[] pid=Integer.parseInt(PID);
//		int price=Integer.parseInt(p_price);
//		int count =Integer.parseInt(pcount);
		// 做成建構子bean
		
		// 放去session
	
//		      //再派遣forward到DisplayStudent    --這邊原先想做的是將DAO處理好的結果-登入成功後-導向會員介面 
//		      request.getRequestDispatcher("/MemberUi.jsp").forward(request,response);
//		DataSource ds = null;
//		InitialContext ctxt = null;
//		Connection conn = null;

		try {

			// 建立Context Object,連到JNDI Server
//			ctxt = new InitialContext();
//
//			// 使用JNDI API找到DataSource
//			ds = (DataSource) ctxt.lookup("java:comp/env/jdbc/EmployeeDB");
//			// ds = ( DataSource ) ctxt.lookup("jdbc/OracleXE");
//			// 向DataSource要Connection
//			conn = ds.getConnection();
//			RecordDao userDao = RecordDaoFactory.getRecordDao();
//			userDao.createConn();
			// 建立Database Access Object,負責Table的Access
//			RecordDao recordDao = new RecordDao(conn);
			System.out.println("Get some SQL commands done勾勾畫面!00");
			Record recordData = (Record) request.getSession(true).getAttribute("reg_student");
//			if (recordDao.insertRecord(recordData)) {
				System.out.println("Get some SQL commands done勾勾畫面!");
				request.getSession(true).invalidate();
				request.getRequestDispatcher("/buysuccess.jsp").forward(request, response);
//			}
		 
//		catch (NamingException ne) {
//			System.out.println("Naming Service Lookup Exception");
//		} c
//		atch (SQLException e) {
//			System.out.println("Database Connection Error");
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
//				if (conn != null)
//					conn.close();
			} catch (Exception e) {
				System.out.println("Connection Pool Error!");
			
			}

		}
	}
}
