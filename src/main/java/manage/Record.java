package manage;

import java.io.Serializable;

public class Record implements Serializable{
	private int record_id ;
	private String[] PID;
	private String[] p_name;
	private String[] p_price;
	//private String buy_time;
	//private String userEmail;
	private String[] pcount;
	public Record()
	   {
	   }
	  public Record(int record_id, String[] PID, String[] p_name,String[] p_price,String[] pcount) {
	     this.record_id = record_id;
	     this.PID = PID;
	     this.p_name = p_name;
	     this.p_price = p_price;
	     this.pcount = pcount;
	    
	   }
	public int getRecord_id() {
		return record_id;
	}
	public void setRecord_id(int record_id) {
		this.record_id = record_id;
	}
	public  String[] getPID() {
		return PID;
	}
	public void setPID( String[] pID) {
		PID = pID;
	}
	public  String[] getP_name() {
		return p_name;
	}
	public void setP_name( String[] p_name) {
		this.p_name = p_name;
	}
	public  String[] getP_price() {
		return p_price;
	}
	public void setP_price( String[] p_price) {
		this.p_price = p_price;
	}
	
	public  String[] getPcount() {
		return pcount;
	}
	public void setPcount( String[] pcount) {
		this.pcount = pcount;
	}

}
