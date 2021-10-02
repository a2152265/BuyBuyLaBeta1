package mvc.bean;

import java.io.Serializable;
public class StudentBean implements Serializable{
	
	private String userEmail;
	  private String userPhone;
	  private String userPwd;
//	  private String[] gender;
//	  private String[] vec;
	 
	  
	  public StudentBean()
	  {
	  }
	  
	  public StudentBean(String pUserEmail, String pUserPhone, String pUserPwd)
	  {
	    this.userEmail = pUserEmail;
	    this.userPhone = pUserPhone;
	    this.userPwd = pUserPwd;
//	    this.gender = pGender;
//	    this.vec = pVec;
	   
	  }

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String pUserEmail) {
		this.userEmail = pUserEmail;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String pUserPhone) {
		this.userPhone = pUserPhone;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String pUserPwd) {
		this.userPwd = pUserPwd;
	}
	  
	  

	
//	  public void setName(String pName)
//	  {
//	    this.name=pName;
//	  }
//
//	  public String getName()
//	  {
//	    return name;
//	  }
//
//	  public void setBirthyear (String pBirthyear)
//	  {
//	    this.birthyear=pBirthyear;
//	  }
//
//	  public String getBirthyear()
//	  {
//	    return birthyear;
//	  }
//
//	  public void setBirthmonth (String pBirthmonth)
//	  {
//	    this.birthmonth=pBirthmonth;
//	  }
//
//	  public String getBirthmonth()
//	  {
//	    return birthmonth;
//	  }
//
//	  public void setBirthday (String pBirthday)
//	  {
//	    this.birthday=pBirthday;
//	  }
//
//	  public String getBirthday()
//	  {
//	    return birthday;
//	  }
//
//	  public void setId (String pId)
//	  {
//	    this.id=pId;
//	  }
//	  
//	  public String getId()
//	  {
//	    return id;
//	  }
//
//	  public void setZipcode (String pZipcode)
//	  {
//	    this.zipcode=pZipcode;
//	  }
//	  
//	  public String getZipcode()
//	  {
//	    return zipcode;
//	  }
//
//	  public void setAddress (String pAddress)
//	  {
//	    this.address=pAddress;
//	  }
//
//	  public String getAddress()
//	  {
//	    return address;
//	  }
//
//	  public void setPhone (String pPhone)
//	  {
//	    this.phone=pPhone;
//	  }
//
//	  public String getPhone()
//	  {
//	    return phone;
//	  }
//
//	  public void setMailaddress (String pMailaddress)
//	  {
//	    this.mailaddress=pMailaddress;
//	  }
//
//	  public String getMailaddress()
//	  {
//	    return mailaddress;
//	  }

}
