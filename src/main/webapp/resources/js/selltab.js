/**
 * 
 */

$(function(){
  /* 초기화 : 첫번째 탭이 기본적으로 활성화 되어있도록 */
  $(".buy_tab li:first-of-type, .item:first-of-type").addClass("on").attr("tabindex","0").attr("aria-expanded","true");
  $(".buy_tab li:first-of-type").attr("aria-selected","true");
  $(".amount").hide();

  /* 탭 클릭 시 전환 */
  $('.buy_tab li').click(function(e){
    e.preventDefault();
    $(this).addClass("on").attr("aria-selected", "true").siblings().removeClass("on").attr("aria-selected","false");
    $("#" + $(this).attr("aria-controls")).attr("tabindex","0").addClass("on").siblings(".item").attr("tabindex","-1").removeClass("on");
    
    if(!$('.deadline_info_area').is(':visible')){
    	$(".deadline_info_area").show();
    	$(".price_now_title").text("판매 희망가");
    	$(".input_amount").show();
    	$(".amount").hide();
    	$(".price_now").addClass("active_input");
    	$(".btn_confirm").children().text(" 판매 입찰 계속 ");
    	$(".btn_confirm").children().addClass("disabled").addAttr("disabled");
    	
    	
    	
    }else{
    	$(".deadline_info_area").hide();
    	$(".price_now_title").text("즉시 판매가");
    	$(".input_amount").hide();
    	$(".amount").show();
    	$(".price_now").removeClass("active_input");
    	$(".btn_confirm").children().text(" 즉시 판매 계속 ");
    	$(".btn_confirm").children().removeClass("disabled").removeAttr("disabled");
    	
    }
  })
})