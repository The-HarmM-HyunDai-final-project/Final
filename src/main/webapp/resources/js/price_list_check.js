/**
 * 판매 후 가격리스트 
 */

$(function(){
	let selectBtn = $(".select_item");
	let size 
	
	selectBtn
			.on(
					"click",
					function(e) {
						
						console.log("사이즈 클릭!!!!!");
						//console.log(e.currentTarget);	
						const list = e.currentTarget;
				        console.log(list);
				        $(this).addClass("active").attr("aria-selected", "true").siblings().removeClass("active").attr("aria-selected","false");
						size = list.getElementsByClassName("size")[0].innerHTML;
						console.log(size);
					});

})