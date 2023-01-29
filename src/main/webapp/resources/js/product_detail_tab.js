/**
 * 
 */

$(function(){
  /* 초기화 : 첫번째 탭이 기본적으로 활성화 되어있도록 */
  $(".tab_list li:first-of-type, .tab_content:first-of-type").addClass("show").attr("tabindex","0").attr("aria-expanded","true");
  $(".tab_list li:first-of-type").attr("aria-selected","true");
  

  //탭 클릭 시 전환 
  $('.wrap_bids .tab_list li').click(function(e){
	e.preventDefault();
    //$('ul.tab_list li').addClass('on');
    $(this).addClass("show").attr("aria-selected", "true").siblings().removeClass("show").attr("aria-selected","false");
    $(".wrap_bids #" + $(this).attr("aria-controls")).attr("tabindex","0").addClass("show").siblings(".tab_content").attr("tabindex","-1").removeClass("show");
    $(this).addClass("on").attr("aria-selected", "true").siblings().removeClass("on").attr("aria-selected","false");
    $(".wrap_bids #" + $(this).attr("aria-controls")).attr("tabindex","0").addClass("on").siblings(".tab_content").attr("tabindex","-1").removeClass("on");
   
   
  })
  
  $('.wrap_sales .tab_list li').click(function(e){
	e.preventDefault();
    $(this).addClass("show").attr("aria-selected", "true").siblings().removeClass("show").attr("aria-selected","false");
    $(".wrap_sales #" + $(this).attr("aria-controls")).attr("tabindex","0").addClass("show").siblings(".tab_content").attr("tabindex","-1").removeClass("show");
    $(this).addClass("on").attr("aria-selected", "true").siblings().removeClass("on").attr("aria-selected","false");
    $(".wrap_sales #" + $(this).attr("aria-controls")).attr("tabindex","0").addClass("on").siblings(".tab_content").attr("tabindex","-1").removeClass("on");
   
   
  })
  
  $('.tab_info .tab_list li').click(function(e){
	e.preventDefault();
	$(this).addClass("on").attr("aria-selected", "true").siblings().removeClass("on").attr("aria-selected","false");
	$(".tab_info #" + $(this).attr("aria-controls")).attr("tabindex","0").addClass("show").attr("aria-expanded","true").siblings(".tab_content").attr("tabindex","-1").removeClass("show").attr("aria-expanded","false");
	$(".tab_info #" + $(this).attr("aria-controls")).find(".market_price_table").css("display","block");
   
  })
  
  $('#moreSignContract').click(function(e){
	  document.body.style.overflow = "hidden";
	  $('.layer_market_price').css("display","block");
	  $('#tab_info_panel1').addClass("on").attr("aria-selected", "true").siblings().removeClass("on").attr("aria-selected","false");
	  $(".tab_info #panel1").attr("tabindex","0").addClass("show").attr("aria-expanded","true").siblings(".tab_content").attr("tabindex","-1").removeClass("show").attr("aria-expanded","false");
  })
  
  $('#moreSellBid').click(function(e){
	  document.body.style.overflow = "hidden";
	  $('.layer_market_price').css("display","block");
	  $('#tab_info_panel2').addClass("on").attr("aria-selected", "true").siblings().removeClass("on").attr("aria-selected","false");
	  $(".tab_info #panel2").attr("tabindex","0").addClass("show").attr("aria-expanded","true").siblings(".tab_content").attr("tabindex","-1").removeClass("show").attr("aria-expanded","false");
  })
  
  $('#moreBuyBid').click(function(e){
	  document.body.style.overflow = "hidden";
	  $('.layer_market_price').css("display","block");
	  $('#tab_info_panel3').addClass("on").attr("aria-selected", "true").siblings().removeClass("on").attr("aria-selected","false");
	  $(".tab_info #panel3").attr("tabindex","0").addClass("show").attr("aria-expanded","true").siblings(".tab_content").attr("tabindex","-1").removeClass("show").attr("aria-expanded","false");
  })
  
  $('.btn_layer_close').click(function(e){
		
		 document.body.style.overflow = "visible";
		 $('.layer_market_price').css("display","none");
		 
	})
   
	 
	 
  
})


