
import javax.servlet.*;
//import javax.servlet.http.*;
//import java.io.PrintWriter;
//import java.io.IOException;

import java.io.*;

import java.sql.*;
//import javax.rmi.*;
import javax.naming.*;
import javax.sql.*;

import mvc.bean.CampaignBean;

//import mvcdemo.bean.RegisterBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class RegisterServlet
 */
@MultipartConfig
@WebServlet("/RegisterFormServlet")
public class RegisterFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
	private static final String CHARSET_CODE = "UTF-8";

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding(CHARSET_CODE);
		response.setContentType(CONTENT_TYPE);

		response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0
		response.setDateHeader("Expires", -1); // Prevents caching at the proxy server

		if (request.getParameter("submit") != null)
			gotoSubmitProcess(request, response);
		else if (request.getParameter("confirm") != null)
			gotoConfirmProcess(request, response);
		else if (request.getParameter("return") != null)
			 request.getRequestDispatcher("/main.html").forward(request, response);
	}

	public void gotoSubmitProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Part imgPart;
		byte[] img = new byte[1024];
		String name;
		String description;
		String note;
		String url;
		imgPart=request.getPart("image");
		url=request.getParameter("url").trim();
		name = request.getParameter("name").trim();
		description = request.getParameter("description").trim();
		note = request.getParameter("note").trim();
		
		InputStream in = imgPart.getInputStream();
		// read bytes from bis ...
		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		 
		int length;
		while( (length = in.read(img)) != -1){
	            //從緩衝區讀取buffer裡面0~length-1的位置
			bos.write(img, 0, length);
	    }
		// write bytes to bos ...
		img = bos.toByteArray();
		
		
		CampaignBean reg = new CampaignBean(img,url,name,description,note);
		request.getSession(true).setAttribute("reg", reg);
//		request.getRequestDispatcher("/DisplayRegister.jsp").forward(request, response);
		gotoConfirmProcess(request, response);
	}

	public void gotoConfirmProcess(HttpServletRequest request, HttpServletResponse response)
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
			CampaignBean data = (CampaignBean) request.getSession(true).getAttribute("reg");
			if (registerDAO.insertData(data)) {
				System.out.println("Get some SQL commands done!");
			    request.getRequestDispatcher("/addsuccess.jsp").forward(request, response);
				response.getWriter().println("新增活動成功");
				request.getSession(true).invalidate();
				
			}
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
