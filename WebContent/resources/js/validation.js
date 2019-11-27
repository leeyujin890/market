function CheckAddProduct(){
	var productID=document.getElementById("productID");
	var pname=document.getElementById("pname");
	var unitPrice=document.getElementById("unitPrice");
	var unitsInStock=document.getElementById("unitsInStock");
	
	// 상품 아이디 체크 
	if(!check(/^P[0-9]{4,11}$/,productID,"[상품코드] \n P와 숫자를 조합하여 5~12자까지 입력하세요. \n 첫글자는 반드시 P로 시작하세요."))
		return false;
	
	// 상품명 체크
	if(pname.value.length<4 || pname.value.length>12){
		alert("[상품명] 4자~12자 이내로 입력하시오.");
		name.select();
		name.focus();
		return false;
	}
	
	// 상품 가격 체크
	if(unitPrice.value.length==0 || isNan(unitPrice.value.length)){
		alert("[가격] \n 숫자만 입력하세요.");
		unitPrice.select();
		unitPrice.focus();
		return false;
	}
	
	if(unitPrice<0){
		alert("[가격]\n 음수는 입력할 수 없습니다.");
		unitPrice.select();
		unitPrice.focus();
		return false;
	}else if(!check(/^\d+(?:[.]?[\d]?[\d])?$/, unitPrice,"[가격]\n 소수점 둘째 자리까지만 입력하세요."))
			return false;
	
	// 상품 재고 수 체크
	if (isNaN(unitInStock.value)){
		alert("[재고수]\n 숫자만 입력하세요.")
		unitInStock.select();
		unitInStock.focus();
		return false;
	}

	// 유효성 검사
	function check(regExp,e,msg){
		if(regExp.test(e.value)){
			return true;
		}
		alert(msg);
		e.select();
		e.focus();
		return false;
	}
	document.newProduct.submit();
}