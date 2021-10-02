package pro;

import java.io.Serializable;

public class ProBean implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String leader;
	private String productName;
	private int quantity;
	private int price;
	private int discount;
	private int newprice;
	private String date;
	private String deadline;
	private String state;
//	private byte[] img;
	
	public ProBean() {
	}

		public ProBean(String leader, String productName,int quantity,int price,int discount,int newprice,String date,String deadline) {
		this.leader = leader;
		this.productName = productName;
		this.quantity=quantity;
		this.price = price;
		this.discount=discount;
		this.newprice=newprice;
		this.date = date;
		this.deadline=deadline;
//		this.img=img;
	}
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
			this.id = id;
	}
		
	public String getLeader() {
		return leader;
	}

	public void setLeader(String leader) {
		this.leader = leader;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}
	
	public int getNewprice() {
		return newprice;
	}

	public void setNewprice(int newprice) {
		this.newprice = newprice;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	public String getDeadline() {
		return deadline;
	}

	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
//	public byte getImg() {
//		return img;
//	}
//
//	public void setImg(byte img) {
//		this.img = img;
//	}


}
