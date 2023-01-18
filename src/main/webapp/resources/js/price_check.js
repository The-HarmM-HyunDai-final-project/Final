/**
 * 해당 모든 입력이 되었는지 확인해 버튼 활설화로 만드는 함수 
 */

   $(window)
         .ready(
               function() { 
            	   
       $('.price').on("click", function(){
    	   if($('.input_amount').val() < "30000" && $('.input_amount').val() != "0"){
    		   alert("형식에 맞게 입력해주세요");
    	   }
       });      	   
            	   
            	   
    });
