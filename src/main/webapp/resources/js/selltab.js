/**
 * 
 */

$(function(){
	 $('#sellNow').click(function(e){
	    	$('#sellNow').addClass("on");
	    	$('#sellBid').removeClass("on");
	    	console.log(" 1111")
	    	$('.price_now_title').text("즉시 구매가");
	    	
	    	document.getElementById('testbid').style.display = 'none';
	    	console.log(" 1111")
//	    	버튼이 보이게
	    	document.getElementById('testsell').style.display = 'block';
	    	
	  })
	  
	     $('#sellBid').click(function(e){
	     	$('#sellNow').removeClass("on");
	    	$('#sellBid').addClass("on");
	    	$('.price_now_title').text("구매 희망가");
	    	
	    	console.log(" 1111")
	    	document.getElementById('testbid').style.display = 'block';
	    	console.log(" 1111")
//	    	버튼이 보이게
	    	document.getElementById('testsell').style.display = 'none';
	  })
	  
})