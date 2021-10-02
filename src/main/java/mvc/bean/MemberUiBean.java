package mvc.bean;

import java.io.Serializable;

public class MemberUiBean implements Serializable{
	
	private String uiName;
	  private String uiEmail;
	  private String uiPhone;
	  private String uiGender;

	  
	  public MemberUiBean()
	  {
	  }
	  
	  public MemberUiBean(String pUiName, String pUiPhone, String pUiGender,String pUiEmail)
	  {
	    this.uiName = pUiName;
	    this.uiEmail = pUiEmail;
	    this.uiPhone = pUiPhone;
	    this.uiGender = pUiGender;
	   
	  }

	public String getUiName() {
		return uiName;
	}

	public void setUiName(String pUiName) {
		this.uiName = pUiName;
	}

	public String getUiEmail() {
		return uiEmail;
	}

	public void setUiEmail(String pUiEmail) {
		this.uiEmail = pUiEmail;
	}

	public String getUiPhone() {
		return uiPhone;
	}

	public void setUiPhone(String pUiPhone) {
		this.uiPhone = pUiPhone;
	}

	public String getUiGender() {
		return uiGender;
	}

	public void setUiGender(String pUiGender) {
		this.uiGender = pUiGender;
	}
//
//	public String getEmailLogin() {
//		return emailLogin;
//	}
//
//	public void setEmailLogin(String pEmailLogin) {
//		this.emailLogin = pEmailLogin;
//	}
//
//	public String getPwdLogin() {
//		return pwdLogin;
//	}
//
//	public void setPwdLogin(String pPwdLogin) {
//		this.pwdLogin = pPwdLogin;
//	}
	  

}
