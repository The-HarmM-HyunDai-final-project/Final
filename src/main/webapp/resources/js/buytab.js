/**
 * 
 */

$(function(){
  /* 초기화 : 첫번째 탭이 기본적으로 활성화 되어있도록 */
/*  $(".buy_tab li:first-of-type, .item:first-of-type").addClass("on").attr("tabindex","0").attr("aria-expanded","true");
  $(".buy_tab li:first-of-type").attr("aria-selected","true");
  $(".amount").hide();

  //탭 클릭 시 전환 
  $('.buy_tab li').click(function(e){
    e.preventDefault();
    $(this).addClass("on").attr("aria-selected", "true").siblings().removeClass("on").attr("aria-selected","false");
    $("#" + $(this).attr("aria-controls")).attr("tabindex","0").addClass("on").siblings(".item").attr("tabindex","-1").removeClass("on");
    
   
  })*/
    $('#buyNow').click(function(e){
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
  
  
})