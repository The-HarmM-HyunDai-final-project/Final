/*신미림작성*/
$(function(){

    $('#buyNow').click(function(e){
    	let nowBuyPrice = parseInt((document.getElementById('nowBuyPrice').innerText).replaceAll(',',''));
    	if(nowBuyPrice <= 0){
    		return;
    	}
    	
    	$('#buyNow').addClass("on");
    	$('#buyBid').removeClass("on");
    	console.log(" 1111")
    	$('.price_now_title').text("즉시 구매가");
    	
    	document.getElementById('test').style.display = 'none';
    	console.log(" 1111")
//    	버튼이 보이게
    	document.getElementById('buytest').style.display = 'block';
    	
  })
  
     $('#buyBid').click(function(e){
     	$('#buyNow').removeClass("on");
    	$('#buyBid').addClass("on");
    	$('.price_now_title').text("구매 희망가");
    	
    	console.log(" 1111")
    	document.getElementById('test').style.display = 'block';
    	console.log(" 1111")
//    	버튼이 보이게
    	document.getElementById('buytest').style.display = 'none';
  })
  
  
	  $('#bidBuyActionClick').click(function(e){
		  if(document.getElementById("bidBuyPrice").value.replaceAll(',','')<=0){
			alert("올바른 금액을 입력하세요");  
			return;
		  }
		 document.getElementById("bidBuyPrice").value = document.getElementById("bidBuyPrice").value.replaceAll(',','');
		 document.getElementById("bidBuyAction").submit();
	 })
	 
	 	  const input = document.querySelector('#bidBuyPrice');      //[1]
	  input.addEventListener('change', function(e) { 
		  let price = e.target.value;
		  price = Number(price.replaceAll(',', ''));
		  let nowBuyPrice = parseInt((document.getElementById('nowBuyPrice').innerText).replaceAll(',',''));
		  
		  if(price>=nowBuyPrice && nowBuyPrice > 0 ){
			  
			  
			  document.getElementById("bidBuyPrice").value = null;
			
			  $("#buyNow").trigger("click");
			  return;
		  }
		  
		  
		  
		  if(isNaN(price) || price <= 0) {         //NaN인지 판별
			    input.value = 0;   
		
			  }else {                   //NaN이 아닌 경우
			    const formatPrice = price.toLocaleString('ko-KR');
			    input.value = formatPrice;
			    
			   
			  } 
		

	    
		  
	  })  //[2]
	 
	 
  
  
})