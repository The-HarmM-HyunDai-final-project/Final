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
	
	var showLiveMessage = JSON.stringify({//object-> string���� 
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
//�������� �޽����� �޾��� �� -> ����, ����, ä��, ��� ��� �̰�����!
function onMessage(msg) {
	
}
//ä��â���� ������ ��
function onClose(evt) {

}
//ä��â�� ������ ��
function onOpen(evt) {
	
}
</script>
</html>