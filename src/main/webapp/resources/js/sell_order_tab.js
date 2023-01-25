/**
 * 
 */

$(function(){
	
	
	
	 $('#addAcount').click(function(e){
		 document.body.style.overflow = "hidden";
		 document.getElementById("layer_payout_account").style.display = "block";
	  })
	  
	  $('#changeAcount').click(function(e){
		 document.body.style.overflow = "hidden";
		 document.getElementById("layer_payout_account").style.display = "block";
	  })
	  
	  $('#btn_layer_close').click(function(e){
		  $("#bank_name").val('');
		  $("#account_number").val('');
		  $("#account_owner").val('');
		  $("#saveBtn").attr("disabled",true);
	 	  $("#saveBtn").addClass("disabled");
		  
		 document.body.style.overflow = "visible";
		 document.getElementById("layer_payout_account").style.display = "none";
	  })
	  
	  $("#bank_name").on('input',function(){
		  if($("#bank_name").val()=='' || $("#account_number").val()=='' || $("#account_owner").val()==''){
		 		$("#saveBtn").attr("disabled",true);
		 	    $("#saveBtn").addClass("disabled");
		 	}
		 	else{
		 		$("#saveBtn").attr("disabled",false);
		 		$("#saveBtn").removeClass("disabled");
		 	}
	  });
	 
	 $("#account_number").on('input',function(){
		 	if($("#bank_name").val()=='' || $("#account_number").val()=='' || $("#account_owner").val()==''){
		 		$("#saveBtn").attr("disabled",true);
		 	    $("#saveBtn").addClass("disabled");
		 	}
		 	else{
		 		$("#saveBtn").attr("disabled",false);
		 		$("#saveBtn").removeClass("disabled");
		 	}
		 		
	  });
	 
	 $("#account_owner").on('input',function(){
		 if($("#bank_name").val()=='' || $("#account_number").val()=='' || $("#account_owner").val()==''){
		 		$("#saveBtn").attr("disabled",true);
		 	    $("#saveBtn").addClass("disabled");
		 	}
		 	else{
		 		$("#saveBtn").attr("disabled",false);
		 		$("#saveBtn").removeClass("disabled");
		 	}
	  });
	  
	     
	  
})