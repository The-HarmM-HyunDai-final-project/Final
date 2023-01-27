<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Broadcast To IVS</title>
<!-- Google Fonts -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,300italic,700,700italic" />
<!-- CSS Reset -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.css" />
<!-- Milligram CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/milligram/1.4.1/milligram.css" />
<script src="https://web-broadcast.live-video.net/1.2.0/amazon-ivs-web-broadcast.js"></script>
<style>
    #preview {
      margin-bottom: 1.5rem;
      background: green;
      width: 100%;
      height: 300;
    }
  </style>
</head>
<body>  
  <!-- Compositor preview -->
  <section class="container">
    <canvas id="preview"></canvas>
  </section>
  
    <!-- Error alert -->
  <section class="container">
    <h3 id="error"></h3>
  </section>
  
  <!--  Select -->
  <section class="container">
    <label for="video-devices">Select Webcam</label>
    <select id="video-devices">
      <option selected>Choose Option</option>
    </select>

    <label for="audio-devices">Select Microphone</label>
    <select id="audio-devices">
      <option selected>Choose Option</option>
    </select>

    <label for="stream-config">Select Channel Config</label>
    <select id="stream-config">
      <option selected>Choose Option</option>
    </select>
  </section>
  
 <!-- 
  <section class="container">
 <h1>엔드포인트 = ${recent.aws_endpoint}</h1>
 <input type="hidden" id="stream-key" value="${recent.aws_endpoint}"/>
 </section>
  <section class="container">
 <h1>스트림키 = ${recent.aws_stream_key }</h1>
 <input type="hidden" id="ingest-endpoint" value="${recent.aws_stream_key}"/>
  </section>-->
  
  <!-- Ingest Endpoint input -->
  <section class="container">
    <label for="ingest-endpoint">Ingest Endpoint</label>
    <input type="text" id="ingest-endpoint" value="${recent.aws_endpoint}" />
  </section>

  <!-- Stream Key input -->
  <section class="container">
    <label for="stream-key">Stream Key</label>
    <input type="text" id="stream-key" value="${recent.aws_stream_key}" />
  </section>
  
  <!-- Broadcast buttons -->
  <section class="container">
    <button class="button" id="start" onclick="startBroadcast()">Start Broadcast</button>
    <button class="button" id="stop" onclick="stopBroadcast()">Stop Broadcast</button>
  </section>
	
	<!-- Data table -->
  <section class="container">
    <table id="data">
      <tbody></tbody>
    </table>
  </section>

<script src="${pageContext.request.contextPath}/resources/js/admin/showliveonair.js" defer=""></script>
</body>



<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script>
var sock = new SockJS('http://localhost:8080/BJchatting');
sock.onmessage = onMessage;
sock.onclose = onClose;
sock.onopen = onOpen;
function sendMessage(type, msg, qyn) {		
	var cur_id = '${userid}'; 
	
	var showLiveMessage = JSON.stringify({//object-> string으로 
			/* userName : cur_id, */
			message : msg,
			mType : type,
			question_yn : qyn
	})
	sock.send(showLiveMessage)
	/* if(type=="TALK"){
		var message = "TALK:"+ $("#msg").val();
		sock.send(message);
	}else if(type == "AUCTION"){
		var message = "AUCTION:"+ $("#auction_sugest").val();
		sock.send(message);
	} */
	
}
//서버에서 메시지를 받았을 때 -> 입장, 퇴장, 채팅, 경매 모두 이곳으로!
function onMessage(msg) {
	
}
//채팅창에서 나갔을 때
function onClose(evt) {
}
//채팅창에 들어왔을 때
function onOpen(evt) {
	
}
</script>
</html>