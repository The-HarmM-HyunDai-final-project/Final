   //전역변수 선언-모든 홈페이지에서 사용 할 수 있게 index에 저장
   var socket = null;

   $(document).ready(function (){
      
      connectWs();
   });

   function connectWs(){
      
      //sock = new SockJS('/replyEcho');
      sock = new SockJS('http://localhost:8080/echo');
      socket = sock;

      sock.onopen = function() {
           console.log('info: connection opened.');
     };

     // 클라이언트 쪽에서 수신된 메세지를 받고 실행되는 부분
    sock.onmessage = function(evt) {
       var data = evt.data;
         //console.log("ReceivMessage : " + data + "\n");
         //var receiverEmail = urlParams.get("email");
      //console.log("receiverEmail " + receiverEmail);
      var list = data.split("!");
         // 이건 알림시 알림 숫자 올리기
/*         $.ajax({
         url : '/alarm/countAlarm',
         dataType: 'text',
         data : {
            "receiverEmail" : receiverEmail
         },
         success : function(data) {
            if(data == '0'){
            }else{
               //$('#alarmCnt').addClass('bell-badge-danger bell-badge')
               $('#alarmCnt').text(data);
            }
         },
         error : function(err){
            alert('err');
         }
         });*/
         
         $.ajax({      
               url: "/alarm/countAlarm",
               
            }).done(function (data) {
               console.log("countAlarm " + data);
               //$('#alarmCnt').addClass('bell-badge-danger bell-badge')
               $('#alarmCnt').text(data);
               $("#alarmCnt").css.fontSize = '20px';
            });   

         // 모달 알림
         /*var toastTop = app.toast.create({
            text: "알림 : " + data + "\n",
            position: 'top',
            closeButton: true,
          });
          toastTop.open(); */
         
         alert(list[0] + list[1]);
         
         let toast = "";
/*                  toast = `
                              <div class="toast" role="alert" aria-live="assertive"  style="display : block; font-size: 1.5rem; background-color: rosybrown;"
                                 aria-atomic="true" data-alarmid = "`+list[1]+`" id = "alarmid`+list[1]+`">
                                 <div class="toast-header">
                                    <strong
                                       class="me-auto">ALARM</strong> 
                                    <button type="button" class="btn-close" data-bs-dismiss="toast" 
                                       aria-label="Close" data-alarmid = "`+list[1]+`"></button>
                                 </div>
                                 <div class="toast-body">`+ list[0] + `</div>
                              </div>            
                  `*/
         		
         			toast = `
						<div class="toast align-items-center text-white bg-primary border-0" role="alert" aria-live="assertive" style="display : block; font-size: 1.3rem; background-color: rosybrown; box-shadow: 5px 5px 10px grey;"
						    aria-atomic="true" data-alarmid="`+list[1]+`" id="alarmid`+list[1]+`">
						    <div class="d-flex">
						        <div class="toast-body">`+ list[0] + `</div>
						        <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"
						            aria-label="Close" data-alarmid="`+list[1]+`"></button>
						    </div>
						</div>
         			`
						            

         
/*         		toast = `
					<div class="toast align-items-center" role="alert" aria-live="assertive" aria-atomic="true">
					  <div class="d-flex">
					    <div class="toast-body">
					    Hello, world! This is a toast message.
					   </div>
					    <button type="button" class="btn-close me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
					  </div>
					</div>
         		`*/
                  $("#toastContainer").append(toast); 
                  
                  
    };

    sock.onclose = function() {
         console.log('connect close');
         /* setTimeout(function(){conntectWs();} , 1000); */
    };

    sock.onerror = function (err) {console.log('Errors : ' , err);};
    
  /*  test************************************************ */
   


   }