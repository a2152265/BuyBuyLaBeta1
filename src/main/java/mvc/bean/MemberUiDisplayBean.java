package mvc.bean;

import java.io.Serializable;

public class MemberUiDisplayBean implements Serializable{
	
	private String uiName;
	  private String uiEmail;
	  private String uiPhone;
	  private String uiGender;
	  private boolean check;

	  
	  public MemberUiDisplayBean()
	  {
	  }
	  
	  public MemberUiDisplayBean(String pUiEmail, String pUiName, String pUiPhone,String pUiGender,boolean pCheck)
	  {
	    this.uiName = pUiName;
	    this.uiEmail = pUiEmail;
	    this.uiPhone = pUiPhone;
	    this.uiGender = pUiGender;
	    this.check = pCheck;
	  }
//
//	public String getUiName() {
//		return uiName;
//	}
//
//	public void setUiName(String pUiName) {
//		this.uiName = pUiName;
//	}
//
//	public String getUiEmail() {
//		return uiEmail;
//	}
//
//	public void setUiEmail(String pUiEmail) {
//		this.uiEmail = pUiEmail;
//	}
//
//	public String getUiPhone() {
//		return uiPhone;
//	}
//
//	public void setUiPhone(String pUiPhone) {
//		this.uiPhone = pUiPhone;
//	}
//
//	public String getUiGender() {
//		return uiGender;
//	}
//
//	public void setUiGender(String pUiGender) {
//		this.uiGender = pUiGender;
//	}

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

	public boolean isCheck() {
		return check;
	}

	public void setCheck(boolean pCheck) {
		this.check = pCheck;
	}


}
