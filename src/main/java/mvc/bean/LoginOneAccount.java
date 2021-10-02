package mvc.bean;

import java.io.Serializable;

public class LoginOneAccount implements Serializable{
	
	private String emailLogin;
	  

	  
	  public LoginOneAccount()
	  {
	  }
	  
	  public LoginOneAccount(String pEmailLogin)
	  {
	    this.emailLogin = pEmailLogin;
	   
//	    this.gender = pGender;
//	    this.vec = pVec;
	   
	  }

	public String getEmailLogin() {
		return emailLogin;
	}

	public void setEmailLogin(String pEmailLogin) {
		this.emailLogin = pEmailLogin;
	}

	

	

}
