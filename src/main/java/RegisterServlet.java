
import javax.servlet.*;
//import javax.servlet.http.*;
//import java.io.PrintWriter;
//import java.io.IOException;
import mvc.bean.*;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.security.interfaces.ECPrivateKey;
import java.sql.*;
//import javax.rmi.*;
import javax.naming.*;
import javax.sql.*;

import org.apache.catalina.Session;

import com.microsoft.sqlserver.jdbc.SQLServerDataTable;
import com.microsoft.sqlserver.jdbc.SQLServerError;
import com.microsoft.sqlserver.jdbc.SQLServerException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterServlet extends HttpServlet {
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

		    // To prevent caching 不讓catch存在
		   response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
		   response.setHeader("Pragma","no-cache"); // HTTP 1.0
		   response.setDateHeader ("Expires", -1); // Prevents caching at the proxy server

		    //按下按鈕時!=null 去gotoSubmitProcess 
		   //註冊葉面
		   if (request.getParameter("submit")!=null)
		   {   
		     gotoSubmitProcess(request, response);
		   }
		   else if (request.getParameter("confirm")!=null)
		     gotoConfirmProcess(request, response);
		   
		   //登入葉面用
		   if(request.getParameter("submitlogin")!=null) {
			   loginGotoSubmitProcess(request,response);	
			   
		   }
		 //會員介面用
		   if(request.getParameter("submitRewrite")!=null) {
			   rewriteGotoSubmitProcess(request,response);	
			   
		   }
		   //會員刪除資料 submitDelete
		   if(request.getParameter("submitDelete")!=null) {
			   deleteGotoSubmitProcess(request,response);	
			   
		   }
		   
		   
		}

	public void gotoSubmitProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userPhone;
		String userEmail;
		String userPwd;

		// 把JSP資料都抓下來存成string (.trim=去空白)
		userPhone = request.getParameter("phone").trim();
		userEmail = request.getParameter("idEmail").trim();
		userPwd = request.getParameter("Password").trim();

		// 做成建構子bean
		StudentBean reg_student = new StudentBean(userPhone, userEmail, userPwd);
		// 放去session
		request.getSession(true).setAttribute("reg_student", reg_student);
		// 再派遣forward到DisplayStudent
		request.getRequestDispatcher("/DisplayStudent.jsp").forward(request, response);
	
	}

	public void gotoConfirmProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//
//		DataSource ds = null;
//		InitialContext ctxt = null;
//		Connection conn = null;

		try {

			// 連線
			StudentDAO sDao = ShopDAOFactory.getStudentDAO();
			sDao.createConn();
			//建立session TEST
//			Session bbSession=new session();
			// 把stu bean抓回來
			StudentBean studentData = (StudentBean) request.getSession(true).getAttribute("reg_student");
			sDao.addMember(studentData);
			
			request.getRequestDispatcher("/UserLoginSus.jsp").forward(request, response);
			System.out.println("帳號創立成功!!");
			
		//清除session
			request.getSession().invalidate();

			// 關閉連線
			sDao.closeConn();
		} catch (Exception e) {
			request.getRequestDispatcher("/FormFail.jsp").forward(request, response);
			System.out.println("帳號重複!!");
			
			e.printStackTrace();
		}

	}

	// 登入葉面建構子
	public void loginGotoSubmitProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		String emailLogin;
		String pwdLogin;
		//先幹掉前面可能有的session
//		request.getSession().invalidate();

		// 把登入資料都抓下來存成string (.trim=去空白)
		emailLogin = request.getParameter("emailLogin").trim();
		pwdLogin = request.getParameter("pwdLogin").trim();

		// 做成建構子bean1
		loginBean reg_student = new loginBean(emailLogin, pwdLogin);
		// 放去session
		request.getSession(true).setAttribute("reg_student", reg_student);
		//email2
//		request.getSession(true).setAttribute("emailLogin", emailLogin);
		//單純存email的建構子3
		LoginOneAccount loginAccount = new LoginOneAccount(emailLogin);
		request.getSession(true).setAttribute("loginAccount", loginAccount);


		// 直接進入主題-SQL登入
		try {

			// 連線
			StudentDAO sDao = ShopDAOFactory.getStudentDAO();
			sDao.createConn();
		// 把stu bean抓回來
			loginBean studentData = (loginBean) request.getSession(true).getAttribute("reg_student");
			
			boolean loginCheck=false;
			
//===============================================================================================================
			//memberUiDisplayBeann
			MemberUiDisplayBean memberUiDisplayBeannn=new MemberUiDisplayBean();
			
			//這邊會去DAO讀取SQL 經過判斷後會有兩個結果 1.登入成功2.登入失敗			
			memberUiDisplayBeannn=sDao.loginMember(studentData);
			
			String nameString=memberUiDisplayBeannn.getUiName();
			String emmailString=memberUiDisplayBeannn.getUiEmail();
			String genderString=memberUiDisplayBeannn.getUiGender();
			String phoneString=memberUiDisplayBeannn.getUiPhone();
			loginCheck=memberUiDisplayBeannn.isCheck();
			System.out.println("nameString="+nameString);
			System.out.println("YYYYYYYYYYY");
			
			
//			// 做成建構子bean
			MemberUiBean reg_memberUiBean = new MemberUiBean(emmailString, nameString,phoneString,genderString);
//			// 放去session
			request.getSession(true).setAttribute("reg_memberUiBean", reg_memberUiBean);
//			//再派遣forward到DisplayStudent -登入成功後-導向會員介面 
			if(loginCheck==false)   //JSP:uiEmail     here:emailLogin
				 request.getRequestDispatcher("/UserLoginFail.jsp").forward(request,response);
			else {
				request.getRequestDispatcher("/TotalHomeLoginComplete.jsp").forward(request,response);
			}
//================================================================================================================
			// 關閉連線
			sDao.closeConn();
		}catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("sonething wrong");
			
			e.printStackTrace();
		} 
	}
		
	
	
	// 會員介面建構子   //修改
		public void rewriteGotoSubmitProcess(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			String uiName;
//			String uiEmail;			
			String uiPhone;
			String uiGender;
				
			// 把報名表資料都抓下來存成string (.trim=去空白)
			uiName = request.getParameter("uiName").trim();
			uiPhone = request.getParameter("uiPhone").trim();
			uiGender = request.getParameter("uiGender");
			//mail是抓session中單獨建立的bean(for email)出來 
			//但是因為抓出來是個物件 所以用建購子的方式用裡面get的方法把值抓出來
			LoginOneAccount uiEmaill=  (LoginOneAccount)request.getSession(true).getAttribute("loginAccount");
			String uiEmail =uiEmaill.getEmailLogin();
			
			System.out.println("uiEmail="+uiEmail);
			System.out.println("uiPhone=" +uiPhone);
			System.out.println("uiGender=" +uiGender);

			// 最後再做成 建構子bean
			MemberUiBean reg_student1 = new MemberUiBean(uiName,uiEmail,uiPhone,uiGender);
			// 放去session
			request.getSession(true).setAttribute("reg_student1", reg_student1);
//			    //再派遣forward到DisplayStudent
//			    request.getRequestDispatcher("/DisplayStudent.jsp").forward(request,response);

			// 直接進入主題-SQL登入
			try {

				// 連線
				StudentDAO sDao = ShopDAOFactory.getStudentDAO();
				sDao.createConn();

				// 把stu bean抓回來
				MemberUiBean studentData = (MemberUiBean) request.getSession(true).getAttribute("reg_student1");
				sDao.rewriteMember(studentData);
				
//				//再給一次bean放session test
				 reg_student1 = new MemberUiBean(uiName,uiEmail,uiPhone,uiGender);
				request.getSession(true).setAttribute("reg_student1", reg_student1);
				//用回原本的loginBean TEST
				
				
				request.getRequestDispatcher("/MemberUiSus.jsp").forward(request, response);

				// 關閉連線
				sDao.closeConn();
			}catch (Exception e) {			
				System.out.println("sonething wrong with rewrite");
				
				e.printStackTrace();
			} 
			
		}
		
		
		
		// 會員介面建構子   //刪除YOOX
				public void deleteGotoSubmitProcess(HttpServletRequest request, HttpServletResponse response)
						throws ServletException, IOException {

					LoginOneAccount uiEmaill=  (LoginOneAccount)request.getSession(true).getAttribute("loginAccount");
					String uiEmail =uiEmaill.getEmailLogin();
					request.getSession(true).setAttribute("uiEmaill", uiEmaill);
					
					System.out.println("uiEmail="+uiEmail);

					// 直接進入主題-SQL登入
					try {
						// 連線
						StudentDAO sDao = ShopDAOFactory.getStudentDAO();
						sDao.createConn();
						// 把stu bean抓回來
//						MemberUiBean studentData = (MemberUiBean) request.getSession(true).getAttribute("reg_student");
						sDao.deleteMember(uiEmail);						
						System.out.println("刪除成功");
//						============================= 幹掉session 回到登入==========================================
						request.getSession().invalidate();

						request.getRequestDispatcher("/UserLoginDeleteSus.jsp").forward(request, response);
						// 關閉連線
						sDao.closeConn();
					}catch (Exception e) {			
						System.out.println("sonething wrong with deleteeeeeeeeee");						
						e.printStackTrace();
					} 
					
				}



}
