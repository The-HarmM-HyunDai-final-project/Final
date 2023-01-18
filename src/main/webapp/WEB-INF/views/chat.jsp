<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
    <style>
      .container {
        height: 100vh;
        background: #f00fff;
      }
      .showlive_container {
        background: #226600;
        height: 100vh;
        max-width: 1800px;
        margin: 0 auto;
        display: flex;
      }
      .left_area {
        padding: 5px;
        background: red;
        width: 75%;
        height: 100%;
        display: flex;
        flex-direction: column;
      }
      .right_area {
        padding: 5px;
        background: rgb(255, 145, 0);
        /* float: left; */
        width: 25%;
        height: 100%;
        display: flex;
        flex-direction: column;
      }
      .video_area {
        position: relative;
        background: green;
        width: 100%;
        height: 70%;
      }
      .user_count {
        position: absolute;

        right: 8px;
      }
      .info_area {
        background: blue;
        width: 100%;
        height: 30%;
      }
      .auction_area {
        background: rgb(255, 0, 255);
        width: 100%;
        height: 30%;
      }
      .chat_area {
        background: rgb(0, 195, 255);
        width: 100%;
        height: 70%;
        display: flex;
        flex-direction: column;
      }
      .chat_view {
        background: #ffffff;
        width: 100%;
        height: 80%;
        padding: 10px;
        overflow-y: scroll;
      }
      .chat_do {
        width: 100%;
        height: 20%;
      }
    </style>
    <div class="container">
      <div class="showlive_container">
        <div class="left_area">
          <div class="video_area">
            <div class="user_count">
              <p>사용자 : <b id="connected_user">0</b> 명</p>
            </div>
          </div>
          <div class="info_area"></div>
        </div>

        <div class="right_area">
          <div class="auction_area">
            <p>닉네임 : <b id="max_price_user">userid</b></p>
            <b> 최고제시가격 : </b>
            <b id="max_price"></b>
            <b>만원 </b>
            <br />
            <input class="chat_input" type="text" id="auction_sugest" />
            <button onclick="suggestion_aution()">입찰신청</button>
          </div>
          <div class="chat_area">
            <div class="chat_view" id="message_box">
              <div>
                <p>아놔</p>
              </div>
            </div>
            <div class="chat_do">
              <input class="chat_input" type="text" id="msg" />
              <button id="button-talk-send">전송</button>
            </div>
          </div>
        </div>
      </div>
    </div>

<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script type="text/javascript">

	var auctionPrevPrice = 100000;
	
	//가격에 콤마 찍기
	function priceToString(price) {
	  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	//최고 가격 찍자
	function writePrice() {
	  $("#max_price").text(priceToString(auctionPrevPrice));
	}
	
	writePrice();//시작할때 처음 제시가격 찍기
	
	//들어온 가격 제시가 현제가격이상 이고 일정간격보다 높게했는지
	function suggestion_aution() {
	  //새로운 제시 가격
	  var mySuggestion = Number($("#auction_sugest").val());
	  //이전 가격의 1/10 보다 높은지 확인 하고 제안을 받아들임
	  if (
	    //auctionPrevPrice - mySuggestion > 0 &&
	    mySuggestion - auctionPrevPrice >=
	    auctionPrevPrice / 10
	  ) {
		  //가격 전송하기
		  sendMessage("AUCTION");
	  } else {
	    alert("이전 제시금액의 최소 1/10이상을 제시하셔야 합니다.");
	  }
	  $("#auction_sugest").val("");
	}
	
	//채팅전송 버튼 누르는 이벤트
	$("#button-talk-send").on("click", function (e) {
	  sendMessage("TALK");
	  $("#msg").val("");
	});
	
	var sock = new SockJS('http://localhost:8080/chatting');
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	sock.onopen = onOpen;

	function sendMessage(type) {
		if(type=="TALK"){
			var message = "TALK:"+ $("#msg").val();
			sock.send(message);
		}else if(type == "AUCTION"){
			var message = "AUCTION:"+ $("#auction_sugest").val();
			sock.send(message);
		}
	}
	//서버에서 메시지를 받았을 때 -> 입장, 퇴장, 채팅, 경매 모두 이곳으로!
	function onMessage(msg) {
		
		var data = msg.data;
		var sessionId = null; //데이터를 보낸 사람
		var message = null;
		
		console.log(msg);
		
		var messageData = JSON.parse(msg['data']);
		var roomNo = messageData['roomNo'];
		var message = messageData['message'];
		var insertDate = messageData['insertDate'];
		var type = messageData['type'];
		var username = messageData['username'];
		var totalUser = messageData['channelTotalUser'];
		var maxSuggestUser = messageData['channelMaxSuggestUser'];
		var maxSuggestPrice = messageData['channelMaxSuggestPrice'];
		
		var cur_session = '${userid}'; //현재 세션에 로그인 한 사람(controller model에서 가져온값)
		//console.log("cur_session : " + cur_session);
		var menent = "울라랄라라라~~~~~~~~~~";
		
		switch(type){
			case 'TALK':
				if(username == cur_session){
					username = '나';
				}
				var str = 
					`<div>
		              <p>\${username} : \${message}</p>
		            </div>`
					/* `<div class='col-6'>
					<div class='alert alert-secondary'>
					<b>\${username} : \${message}</b>
					</div></div>` */
					
				break
			case 'AUCTION':
				$("#max_price").text(priceToString(maxSuggestPrice));
				$("#max_price_user").text(maxSuggestUser);
				break
			case 'ENTER':
				var str =  
					`<div>
		              <b>\${message}</b>
		            </div>`
				$("#max_price").text(priceToString(maxSuggestPrice));
				$("#max_price_user").text(maxSuggestUser);
		        $("#connected_user").text(totalUser)
				break
			case 'LEAVE':
				var str = 
					`<div class='col-6'>
					<div class='alert alert-secondary'>
					<b>\${message}</b>
					</div></div>`
				$("#connected_user").text(totalUser)
				break
		}
		
		$("#message_box").append(str);
		
		
	    //로그인 한 클라이언트와 타 클라이언트를 분류하기 위함
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
	//채팅창에서 나갔을 때
	function onClose(evt) {
	
	}
	//채팅창에 들어왔을 때
	function onOpen(evt) {
		
	}
</script>