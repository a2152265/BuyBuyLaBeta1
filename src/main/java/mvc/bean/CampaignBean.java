package mvc.bean;

import java.io.Serializable;
import java.util.Arrays;

import javax.servlet.http.Part;

public class CampaignBean implements Serializable {
	private byte[] img;
	private String url;
	private String name;
	private String description;
	private String note;
	private int id;
	
	@Override
	public String toString() {
		return "CampaignBean [img=" + Arrays.toString(img) + ", url=" + url + ", name=" + name + ", description="
				+ description + ", note=" + note + ", id=" + id + "]";
	}

	public CampaignBean() {

	}
	
//	public CampaignBean(int id) {
//		this.id = id;
//	}
	
	public CampaignBean(byte[] img, int id ,String name, String description, String note) {
		super();
		this.img = img;
		this.name = name;
		this.description = description;
		this.note = note;
		this.id=id;
	}
	
	
	
	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	public CampaignBean(byte[] img ,int id,String url, String name, String description, String note ) {
		super();
		this.img = img;
		this.url = url;
		this.name = name;
		this.description = description;
		this.note = note;
		this.id=id;
		
	}
	public CampaignBean(byte[] img ,String url, String name, String description, String note ) {
		super();
		this.img = img;
		this.url = url;
		this.name = name;
		this.description = description;
		this.note = note;
		
	}

	public byte[] getImg() {
		return img;
	}

	public void setImg(byte[] img) {
		this.img = img;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

}
