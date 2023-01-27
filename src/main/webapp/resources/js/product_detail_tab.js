/**
 * 
 */

$(function(){
  /* 초기화 : 첫번째 탭이 기본적으로 활성화 되어있도록 */
  $(".tab_list li:first-of-type, .tab_content:first-of-type").addClass("show").attr("tabindex","0").attr("aria-expanded","true");
  $(".tab_list lifirst-of-type").attr("aria-selected","true");
  

  //탭 클릭 시 전환 
  $('.tab_list li').click(function(e){
	e.preventDefault();
    //$('ul.tab_list li').addClass('on');
    $(this).addClass("show").attr("aria-selected", "true").siblings().removeClass("show").attr("aria-selected","false");
    $("#" + $(this).attr("aria-controls")).attr("tabindex","0").addClass("show").siblings(".tab_content").attr("tabindex","-1").removeClass("show");
    $(this).addClass("on").attr("aria-selected", "true").siblings().removeClass("on").attr("aria-selected","false");
    $("#" + $(this).attr("aria-controls")).attr("tabindex","0").addClass("on").siblings(".tab_content").attr("tabindex","-1").removeClass("on");
   
   
  })
   
	 
	 
  
})


