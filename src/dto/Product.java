package dto;

import java.io.Serializable;
public class Product implements Serializable{
	
	private static final long serialVersionUID=-4274700572038677000L;
	
	private String productID; // 상품 아이디
	private String pname; //상품명
	private Integer unitPrice; //상품가격
	private String description; //상품 설명
	private String manufacturer; //제조사
	private String category; //분류
	private long unitsInStock; //재고 수
	private String condition; //신상품 or 중고품 or 재생품 등 
	private String filename; //이미지 파일명
	private int quantity; //장바구니 담은 개수 
	
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	// 생성자 
	public Product(String productID,String pname,Integer unitPrice) {
		this.productID=productID;
		this.pname=pname;
		this.unitPrice=unitPrice;
	}
	public Product() {
		super();
	}

	//getter,setter 
	public String getProductID() {
		return productID;
	}

	public void setProductID(String productID) {
		this.productID = productID;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public Integer getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public long getUnitsInStock() {
		return unitsInStock;
	}

	public void setUnitsInStock(long unitsInStock) {
		this.unitsInStock = unitsInStock;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
}
