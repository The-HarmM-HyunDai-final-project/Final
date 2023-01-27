   //전역변수 선언-모든 홈페이지에서 사용 할 수 있게 index에 저장
   var socket = null;

   $(document).ready(function (){
	   connectWs();
   });

   function connectWs(){
   	
   	//sock = new SockJS('/replyEcho');
   	sock = new SockJS('http://localhost:8082/echo');
   	socket = sock;

   	sock.onopen = function() {
           console.log('info: connection opened.');
     };

    sock.onmessage = function(evt) {
	 	var data = evt.data;
	   	console.log("ReceivMessage : " + data + "\n");

	   	// 이건 알림시 알림 숫자 올리기
	   	/*$.ajax({
			url : '/mentor/member/countAlarm',
			type : 'POST',
			dataType: 'text',
			success : function(data) {
				if(data == '0'){
				}else{
					$('#alarmCountSpan').addClass('bell-badge-danger bell-badge')
					$('#alarmCountSpan').text(data);
				}
			},
			error : function(err){
				alert('err');
			}
	   	});*/

	   	// 모달 알림
	   	/*var toastTop = app.toast.create({
            text: "알림 : " + data + "\n",
            position: 'top',
            closeButton: true,
          });
          toastTop.open(); */
	   	
	   	alert(data);
    };

    sock.onclose = function() {
      	console.log('connect close');
      	/* setTimeout(function(){conntectWs();} , 1000); */
    };

    sock.onerror = function (err) {console.log('Errors : ' , err);};

   }