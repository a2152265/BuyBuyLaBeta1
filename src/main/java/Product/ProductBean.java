package Product;

public class ProductBean {
 private int proId;
 private String proName;
 private String pcID;
 private int proPrice;
 private int proAccount;
 private String proInfo;
 private String proImage;
 
 
 public ProductBean(){
  
 }
 
 public ProductBean(int proId, String proName, String pcID, int proPrice, int proAccount,String proInfo,String proImage) {
  super();
  this.proId = proId;
  this.proName = proName;
  this.pcID = pcID;
  this.proPrice = proPrice;
  this.proAccount = proAccount;
  this.proInfo=proInfo;
  this.proImage = proImage;
 }

// public ProductBean(int proId, String proName, String pcID, int proPrice, int proAccount,String proInfo) {
//  super();
//  this.proId = proId;
//  this.proName = proName;
//  this.pcID = pcID;
//  this.proPrice = proPrice;
//  this.proAccount = proAccount;
//  this.proInfo=proInfo;
// }
 
 public int getProId() {
  return proId;
 }

 public void setProId(int proId) {
  this.proId = proId;
 }

 public String getProName() {
  return proName;
 }

 public void setProName(String proName) {
  this.proName = proName;
 }

 public String getPcID() {
  return pcID;
 }

 public void setPcID(String pcID) {
  this.pcID = pcID;
 }

 public int getProPrice() {
  return proPrice;
 }

 public void setProPrice(int proPrice) {
  this.proPrice = proPrice;
 }

 public int getProAccount() {
  return proAccount;
 }

 public void setProAccount(int proAccount) {
  this.proAccount = proAccount;
 }
 
 public String getproInfo() {
  return proInfo;
 }

 public void setpInfo(String pInfo) {
  this.proInfo = pInfo;
 }

 public String getProImage() {
  return proImage;
 }

 public void setProImage(String proImage) {
  this.proImage = proImage;
 }


 
 
}