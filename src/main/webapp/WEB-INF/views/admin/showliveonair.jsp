<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

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