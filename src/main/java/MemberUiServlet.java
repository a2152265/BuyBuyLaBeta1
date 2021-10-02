
import javax.servlet.*;
//import javax.servlet.http.*;
//import java.io.PrintWriter;
//import java.io.IOException;
import mvc.bean.*;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.sql.*;
//import javax.rmi.*;
import javax.naming.*;
import javax.sql.*;

import com.microsoft.sqlserver.jdbc.SQLServerDataTable;
import com.microsoft.sqlserver.jdbc.SQLServerError;
import com.microsoft.sqlserver.jdbc.SQLServerException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberUiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
	private static final String CHARSET_CODE = "UTF-8";

	public void init(ServletConfig config) throws ServletException {
		super.init(config); // 都是預設
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
		    request.setCharacterEncoding(CHARSET_CODE);
		    response.setContentType(CONTENT_TYPE);
//
//		    // To prevent caching 不讓catch存在
//		   response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
//		   response.setHeader("Pragma","no-cache"); // HTTP 1.0
//		   response.setDateHeader ("Expires", -1); // Prevents caching at the proxy server
 
		    gotoMemberUi(request,response);	
			   System.out.println("request= "+request);
			   System.out.println("response= "+response);
			   
		   	 
		}

	public void gotoMemberUi(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String emailLogin;
		String pwdLogin;
		

		// 把報名表資料都抓下來存成string (.trim=去空白)
		emailLogin = request.getParameter("userEmail").trim();
		pwdLogin = request.getParameter("userPwd").trim();
		
		// 做成建構子bean
		loginBean reg_student = new loginBean(emailLogin, pwdLogin);
		// 放去session
		request.getSession(true).setAttribute("reg_student", reg_student);
		// 再派遣forward到DisplayStudent
		request.getRequestDispatcher("/MemberUi.jsp").forward(request, response);
	}

//	public void gotoConfirmProcess(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
////
////		DataSource ds = null;
////		InitialContext ctxt = null;
////		Connection conn = null;
//
//		try {
//
//			// 連線
//			StudentDAO sDao = ShopDAOFactory.getStudentDAO();
//			sDao.createConn();
//
//			// 把stu bean抓回來
//			StudentBean studentData = (StudentBean) request.getSession(true).getAttribute("reg_student");
//			sDao.addMember(studentData);
//
//			// 關閉連線
//			sDao.closeConn();
//		} catch (Exception e) {
//		
////			System.out.println("sonething wrong");
//			//可以簡化成一行
////			RequestDispatcher dispatcher = request.getRequestDispatcher("/Form.jsp");
////			dispatcher .forward(request, response);
//			request.getRequestDispatcher("/Form.jsp").forward(request, response);
//			System.out.println("帳號重複!!");
//			
//			e.printStackTrace();
//		}
//
//	}
//
//	// 登入葉面建構子
//	public void loginGotoSubmitProcess(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		String emailLogin;
//		String pwdLogin;
//
//		// 把報名表資料都抓下來存成string (.trim=去空白)
//		emailLogin = request.getParameter("emailLogin").trim();
//		pwdLogin = request.getParameter("pwdLogin").trim();
//
//		// 做成建構子bean
//		loginBean reg_student = new loginBean(emailLogin, pwdLogin);
//		// 放去session
//		request.getSession(true).setAttribute("reg_student", reg_student);
////		    //再派遣forward到DisplayStudent
////		    request.getRequestDispatcher("/DisplayStudent.jsp").forward(request,response);
//
//		// 直接進入主題-SQL登入
//		try {
//
//			// 連線
//			StudentDAO sDao = ShopDAOFactory.getStudentDAO();
//			sDao.createConn();
//
//			// 把stu bean抓回來
//			loginBean studentData = (loginBean) request.getSession(true).getAttribute("reg_student");
//			sDao.loginMember(studentData);
//
//			// 關閉連線
//			sDao.closeConn();
//		}catch (Exception e) {
//			// TODO Auto-generated catch block
//			System.out.println("sonething wrong");
//			
//			e.printStackTrace();
//		} 
//
//		
//		
//		
//	}
//	
//	
//	
//	// 會員介面建構子   //修改
//		public void rewriteGotoSubmitProcess(HttpServletRequest request, HttpServletResponse response)
//				throws ServletException, IOException {
//			String uiName;
////			String uiEmail;
//			String uiPhone;
//			String uiGender;
//
//			// 把報名表資料都抓下來存成string (.trim=去空白)
//			uiName = request.getParameter("uiName").trim();
////			uiEmail = request.getParameter("uiEmail").trim();
//			uiPhone = request.getParameter("uiPhone").trim();
//			uiGender = request.getParameter("uiGender");
//			System.out.println("uiPhone=" +uiPhone);
//			System.out.println("uiGender=" +uiGender);
//
//			// 做成建構子bean
//			MemberUiBean reg_student = new MemberUiBean(uiName,uiPhone,uiGender);
//			// 放去session
//			request.getSession(true).setAttribute("reg_student", reg_student);
////			    //再派遣forward到DisplayStudent
////			    request.getRequestDispatcher("/DisplayStudent.jsp").forward(request,response);
//
//			// 直接進入主題-SQL登入
//			try {
//
//				// 連線
//				StudentDAO sDao = ShopDAOFactory.getStudentDAO();
//				sDao.createConn();
//
//				// 把stu bean抓回來
//				MemberUiBean studentData = (MemberUiBean) request.getSession(true).getAttribute("reg_student");
//				sDao.rewriteMember(studentData);
//
//				// 關閉連線
//				sDao.closeConn();
//			}catch (Exception e) {
//				// TODO Auto-generated catch block
//				System.out.println("sonething wrong with rewrite");
//				
//				e.printStackTrace();
//			} 
//
//			
//			
//			
//		}



}
