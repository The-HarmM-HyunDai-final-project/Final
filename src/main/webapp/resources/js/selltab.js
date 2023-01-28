/**
 * 
 */

$(function(){
	
	
	
	 $('#sellNow').click(function(e){
		 let nowSalePrice = parseInt((document.getElementById('nowSalePrice').innerText).replaceAll(',',''));
		 if(nowSalePrice <=0){
	    		return;
	    	}
		 
	    	$('#sellNow').addClass("on");
	    	$('#sellBid').removeClass("on");
	    	console.log(" 1111")
	    	$('.price_now_title').text("즉시 판매가");
	    	
	    	document.getElementById('testbid').style.display = 'none';
	    	console.log(" 1111")
//	    	버튼이 보이게
	    	document.getElementById('testsell').style.display = 'block';
	    	
	    	var price = parseInt((document.getElementById('nowSalePrice').innerText).replaceAll(',',''));
	    	var fee = price * 0.025;
	    	
	    	
	    	document.getElementById('nowSaleFee').innerText = (fee).toLocaleString();
	    	document.getElementById('nowSaleTotalPrice').innerText = (price - fee).toLocaleString();
	  })
	  
	     $('#sellBid').click(function(e){
	     	$('#sellNow').removeClass("on");
	    	$('#sellBid').addClass("on");
	    	$('.price_now_title').text("판매 희망가");
	    	
	    	console.log(" 1111")
	    	document.getElementById('testbid').style.display = 'block';
	    	console.log(" 1111")
//	    	버튼이 보이게
	    	document.getElementById('testsell').style.display = 'none';
	  })
	  
	  
	  $('#bidSaleActionClick').click(function(e){
		  if(document.getElementById("bidSalePrice").value.replaceAll(',','')<=0){
				alert("올바른 금액을 입력하세요");  
				return;
			}
		 document.getElementById("bidSalePrice").value = document.getElementById("bidSalePrice").value.replaceAll(',','');
		 document.getElementById("bidSaleAction").submit();
	 })
	 
	  
	  
	  
	  
	  const input = document.querySelector('#bidSalePrice');      //[1]
	  input.addEventListener('change', function(e) { 
		  let price = e.target.value;
		  price = Number(price.replaceAll(',', ''));
		  let nowSalePrice = parseInt((document.getElementById('nowSalePrice').innerText).replaceAll(',',''));
		  
		  if(price<=nowSalePrice && nowSalePrice > 0){
			  document.getElementById("bidSalePrice").value = null;
			  document.getElementById('bidSaleFee').innerText = '-';
			    document.getElementById('bidSaleTotalPrice').innerText = 0;
			  $("#sellNow").trigger("click");
			  return;
		  }
		  
		  var fee = -(price * 0.025);
		  
		  
		  if(isNaN(price) || fee == 0 || price <=0) {         //NaN인지 판별
		    input.value = 0;   
		    document.getElementById('bidSaleFee').innerText = '-';
		    document.getElementById('bidSaleTotalPrice').innerText = 0;
		  }else {                   //NaN이 아닌 경우
		    const formatPrice = price.toLocaleString('ko-KR');
		    input.value = formatPrice;
		    
		    document.getElementById('bidSaleFee').innerText = (fee).toLocaleString();
		    document.getElementById('bidSaleTotalPrice').innerText = (price + fee).toLocaleString();
		  } 
		  

	    
		  
	  })  //[2]
	  
	  
})