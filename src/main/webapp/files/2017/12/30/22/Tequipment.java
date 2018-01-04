package entity;

import java.util.Date;

public class Tequipment {
	private Integer id;
	private String name;
	private String description;
	private String code;
	private Date addTime;
	private String price;
	private String place;
	private Tuser userId;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
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
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Date getAddTime() {
		return addTime;
	}
	public void setAddTime(Date time4) {
		this.addTime = time4;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public Tuser getUserId() {
		return userId;
	}
	public void setUserId(Tuser userId) {
		this.userId = userId;
	}
}
