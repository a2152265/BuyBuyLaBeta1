package mvc.bean;

import java.io.Serializable;

public class loginBean implements Serializable{
	
	private String emailLogin;
	  private String pwdLogin;

	  
	  public loginBean()
	  {
	  }
	  
	  public loginBean(String pEmailLogin, String pPwdLogin)
	  {
	    this.emailLogin = pEmailLogin;
	    this.pwdLogin = pPwdLogin;
//	    this.gender = pGender;
//	    this.vec = pVec;
	   
	  }

	public String getEmailLogin() {
		return emailLogin;
	}

	public void setEmailLogin(String pEmailLogin) {
		this.emailLogin = pEmailLogin;
	}

	public String getPwdLogin() {
		return pwdLogin;
	}

	public void setPwdLogin(String pPwdLogin) {
		this.pwdLogin = pPwdLogin;
	}
	  
	  

//	public String getUserEmail() {
//		return userEmail;
//	}
//
//	public void setUserEmail(String pUserEmail) {
//		this.userEmail = pUserEmail;
//	}
//
//	public String getUserPhone() {
//		return userPhone;
//	}
//
//	public void setUserPhone(String pUserPhone) {
//		this.userPhone = pUserPhone;
//	}
//
//	public String getUserPwd() {
//		return userPwd;
//	}
//
//	public void setUserPwd(String pUserPwd) {
//		this.userPwd = pUserPwd;
//	}
	  
	  

}
