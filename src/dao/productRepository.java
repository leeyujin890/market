package dao;

import dto.Product;
import java.util.ArrayList;

public class productRepository {
	private ArrayList<Product> listOFProducts = new ArrayList<Product>();
	
	// 기본 생성자에 대한 객체 변수 instance 생성
	private static productRepository instance=new productRepository(); 
	
	public productRepository() {
		Product phone = new Product("p1234","iPhone6s",80000);
		phone.setDescription("4-7-inch, 1334X750 Renina HD display,8-megapixel iSight Camera");
		phone.setCategory("Smart Phone");
		phone.setManufacturer("Apple");
		phone.setUnitsInStock(1000);
		phone.setCondition("New");
		phone.setFilename("p01.PNG");
		
		Product  notebook= new Product("p1235","LG gram",90000);
		notebook.setDescription("13.3-inch, IPS LED display");
		notebook.setCategory("Notebook");
		notebook.setManufacturer("LG");
		notebook.setUnitsInStock(1000);
		notebook.setCondition("Refurbished");
		notebook.setFilename("p02.PNG");
		
		Product  tablet= new Product("p1236","Galaxy Tab S",100000);
		tablet.setDescription("212.8*125.6*6.6mm, Super AMOLED display");
		tablet.setCategory("Tablet");
		tablet.setManufacturer("Samsung");
		tablet.setUnitsInStock(1000);
		tablet.setCondition("Old");
		tablet.setFilename("p03.PNG");
		
		listOFProducts.add(phone);
		listOFProducts.add(notebook);
		listOFProducts.add(tablet);
	}
	
	// 객체 타입의 변수 listOFProducts에 저장된 모든 상품 목록을 가져오는 getAllProducts() 메소드를 작성한다.
	public ArrayList<Product> getAllProducts(){
		return listOFProducts;
	}
	// 객체 변수 instance에 대한 getter()메소드 
	public static productRepository getInstance(){
		return instance;
	}
	
	public Product getproductbyid(String productid) {
		Product productbyid=null;
		
		for(int i=0;i<listOFProducts.size();i++) {
			Product product=listOFProducts.get(i);
			if(product!=null && product.getProductID()!=null&& product.getProductID().equals(productid)){
				productbyid=product;
				break;
			}
		}
		return productbyid;
	}
	//추가 상품 등록
	public void addProduct(Product product) {
		listOFProducts.add(product);
	}
}
