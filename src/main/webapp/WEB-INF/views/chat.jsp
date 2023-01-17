<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<!-- �������� cdn -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="col-6">
			<label><b>ä�ù�</b></label>
		</div>
		<div>
			<div id="msgArea" class="col">
			<!-- ä�� ������ ���� ���� -->
			</div>
			<div class="col-6">
				<div class="input-group mb-3">
					<input type="text" id="msg" class="form-control"
						aria-label="Recipient's username" aria-describedby="button-addon2">
					<div class="input-group-append">
						<button class="btn btn-outline-secondary" type="button"
							id="button-send">����</button>
					</div>
				</div>
			</div>
		</div>
		<div class="col-6"></div>
	</div>
</body>
</html>

<script type="text/javascript">

//���� ��ư ������ �̺�Ʈ
$("#button-send").on("click", function(e) {
	sendMessage();
	$('#msg').val('')
});

var sock = new SockJS('http://localhost:8080/chatting');
sock.onmessage = onMessage;
sock.onclose = onClose;
sock.onopen = onOpen;

function sendMessage() {
	sock.send($("#msg").val());
}
//�������� �޽����� �޾��� �� -> ����, ����, ä��, ��� ��� �̰�����!
function onMessage(msg) {
	
	var data = msg.data;
	var sessionId = null; //�����͸� ���� ���
	var message = null;
	
	//console.log(msg);
	
	var messageData = JSON.parse(msg['data']);
	var roomNo = messageData['roomNo'];
	var message = messageData['message'];
	var insertDate = messageData['insertDate'];
	var type = messageData['type'];
	var username = messageData['username'];
	
	var cur_session = '${userid}'; //���� ���ǿ� �α��� �� ���(controller model���� �����°�)
	//console.log("cur_session : " + cur_session);
	
	switch(type){
		case 'TALK':
			if(username == cur_session){
				username = '��';
			}
			var str = 
				`<div class='col-6'>
				<div class='alert alert-secondary'>
				<b>\${username} : \${message}</b>
				</div></div>`

			break
		case 'AUCTION':
			break
		case 'ENTER':
			var str = 
				`<div class='col-6'>
				<div class='alert alert-secondary'>
				<b>\${message}</b>
				</div></div>`

			break
		case 'LEAVE':
			var str = 
				`<div class='col-6'>
				<div class='alert alert-secondary'>
				<b>\${message}</b>
				</div></div>`
			break
	}
	
	$("#msgArea").append(str);
	
	
    //�α��� �� Ŭ���̾�Ʈ�� Ÿ Ŭ���̾�Ʈ�� �з��ϱ� ����
	/* if(sessionId == cur_session){
		
		var str = 
		`<div class='col-6'>
		<div class='alert alert-secondary'>
		<b>\${sessionId} : \${message}</b>
		</div></div>`
		
		$("#msgArea").append(str);
	}
	else{
		var str = 
			`<div class='col-6'>
			<div class='alert alert-secondary'>
			<b>\${sessionId} : \${message}</b>
			</div></div>`
			
			$("#msgArea").append(str);
	} */		
		/* 	"<div class='col-6'>";
		str += "<div class='alert alert-warning'>";
		str += "<b>" + sessionId + " : " + message + "</b>";
		str += "</div></div>"; */
		
		//$("#msgArea").append(str);
}
//ä��â���� ������ ��
function onClose(evt) {

}
//ä��â�� ������ ��
function onOpen(evt) {
	
}
</script>