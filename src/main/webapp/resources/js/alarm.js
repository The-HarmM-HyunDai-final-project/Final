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

      var list = data.split("!");
         // 이건 알림시 알림 숫자 올리기

         $.ajax({      
               url: "/alarm/countAlarm",
               
            }).done(function (data) {
               console.log("countAlarm " + data);
               //$('#alarmCnt').addClass('bell-badge-danger bell-badge')
               $('#alarmCnt').text(data);
               $("#alarmCnt").css.fontSize = '20px';
            });   


         
         //alert(list[0] + list[1]);
         
         let toast = "";
               
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

                  $("#toastContainer").append(toast); 
                  
                  
    };

    sock.onclose = function() {
         console.log('connect close');
         /* setTimeout(function(){conntectWs();} , 1000); */
    };

    sock.onerror = function (err) {console.log('Errors : ' , err);};
    
  /*  test************************************************ */
   


   }