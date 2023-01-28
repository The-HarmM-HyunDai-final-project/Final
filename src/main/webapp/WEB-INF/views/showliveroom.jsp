<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
    <style>
      .container {
        height: 100vh;
        /* background: #f00fff; */
      }
      .showlive_container {
        /* background: #226600; */
        /* height: 100vh; */
        height : 100%;
        max-width: 1800px;
        margin: 0 auto;
        display: flex;
      }
      .left_area {
        padding: 5px;
        /* background: red; */
        width: 75%;
        height: 100%;
        display: flex;
        flex-direction: column;
      }
      .right_area {
        padding: 5px;
        /* background: rgb(224, 224, 224); */
        /* float: left; */
        width: 25%;
        height: 95%;
        display: flex;
        flex-direction: column;
      }
      .video_area {
        position: relative;
        /* background: green; */
        /* width: 100%; */
        height: 65%;
      }
      .user_count {
        /* position: absolute;
        right: 8px; */
      }
      .info_area {
        background: rgb(224, 224, 224);
        width: 100%;
        height: 20%;
        margin-top:15px;
        border-radius: 15px;
        padding : 15px;
      }
      .info_area .room_title{
      	font-size:15px;
      }
      .info_area .room_product_name{
      	font-size:40px;
      
      }
      .info_area .room_bj{
      
      }
      .info_area .room_start_time{
      
      }
      .auction_area {
        background: rgb(224, 224, 224);
        width: 100%;
        height: 30%;
        padding:15px;
        /* display: flex;
        flex-direction: column; */
        position:relative;
        border-radius: 15px;
      }
      .price_area{
      	position: absolute;
      	top:30%;
      	bottom:50%;
      	font-size:30px;
      }
      .auction_area_suggestion{
      	/* align-self: flex-end;*/
	    position: absolute;
	    display: flex; 
	    bottom:0;
	    width:100%;
	    margin-bottom:15px;
	    padding:10px;
      }
      .chat_input{
      	width:60%;
      }
/*       .suggestion_btn{
      	width:30%;
      } */
      .chat_area {
        background: rgb(224, 224, 224);
        width: 100%;
        height: 60%;
        margin-top:15px;
        display: flex;
        flex-direction: column;
        border-radius: 15px;
      }
      .user_count{
      	text-align:center;
      }
      .chat_view {
        /* background: #ffffff; */
        width: 100%;
        height: 80%;
        padding: 10px;
        overflow-y: scroll;
      }
      .chat_do {
      	display:flex;
        width: 100%;
        height: 20%;
        padding:20px;
      }
      .my_btn{
      border-radius: 15px;
      	background:silver;
      	width:30%;
      	margin : 0 auto;
      }

	/* 모달창 부분 이무니다 */
	  .modal {
        position: absolute;
        z-index:100;
        top: 0;
        left: 0;

        width: 100%;
        height: 100%;

        display: none;

        background-color: rgba(0, 0, 0, 0.4);
      }

      .modal.show {
        display: block;
      }

      .modal_body {
        position: absolute;
        top: 50%;
        left: 50%;

        width: 400px;
        height: 200px;

        padding: 40px;

        text-align: center;

        background-color: rgb(255, 255, 255);
        border-radius: 10px;
        box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

        transform: translateX(-50%) translateY(-50%);
      }
      .modal_body .modal_content {
        position: relative;
        width: 100%;
        height: 100%;
      }
      .modal_body .confirm_price_area {
        position: absolute;
        left: 0;
        right: 0;
        font-size: 40px;
      }
      .modal_body .modal_btns {
        position: absolute;
        left: 0;
        right: 0;
        bottom: 0;
      }
      .modal_body .modal_btns button {
        background: none;
        /* box-shadow: 0px 0px 0px 0px rgba(0, 0, 0, 0.5); */
        width: 120px;
        height: 50px;
        border: 0;
        border-radius: 5px;
        transition: all 0.2s;
      }
      .modal_body .modal_btns button.yes_btn {
        background: #00ae68;
      }
      .modal_body .modal_btns button.close_btn {
        background: #ffaa40;
      }
      .modal_body .modal_btns button:hover {
        margin-top: -2px;
        margin-left: 0px;
        transform: scale(1.1, 1.1);
        -ms-transform: scale(1.1, 1.1);
        -webkit-transform: scale(1.1, 1.1);
        /* box-shadow: 0px 5px 5px -2px rgba(85, 197, 150, 0.25); */
      }
      
    </style>
    <script	src="https://player.live-video.net/1.6.1/amazon-ivs-player.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/test.css">
    <div class="container">
      <div class="showlive_container">
        <div class="left_area">
          <div class="video_area">
              <!-- Player wrapper, forcing 16:9 aspect ratio -->
		      <div class="player-wrapper" style="width:100%; height:100%;">
		        <div class="aspect-spacer"></div>
		        <div class="pos-absolute full-width full-height top-0">
		          <video id="video-player" class="el-player" playsinline controls></video>
		        </div>
		      </div>
<!--             <div class="user_count">
              <p>사용자 : <b id="connected_user">0</b> 명</p>
            </div> -->
          </div>
          <div class="info_area">
          	<div class="room_title">지금 아니면 구할 기회가 없다! 된장포오스</div>
          	<div class="room_product_name">나이키 에어포스 GTA-808</div>
          	<div class="room_bj">Bj : <b>MC민지</b></div>
          	<div class="room_start_time">시작 시간</div>
          </div>
        </div>

        <div class="right_area">
          <div class="auction_area">
          	<div>
          		<p>닉네임 : <b id="max_price_user">userid</b></p>
          	</div>
            <div class="price_area">
	            <b> 최고제시가격 : </b></br>
	            <b id="max_price"></b>
	            <b>만원 </b>
            </div>
            
            <br />
            <div class="auction_area_suggestion">
	            <input type="number" max="2147483640"class="chat_input" id="auction_sugest" placeholder="입찰 가격을 제시해 주세요" />
	            <button class="my_btn" id="auction_btn">입찰신청</button>
            </div>
          </div>
          <div class="chat_area">
          	<div class="user_count" >
              <p>   사용자 : <b id="connected_user">0</b> 명</p>
            </div>
            <div class="chat_view" id="message_box">

            	
            </div>
            <div class="chat_do">
              <input class="chat_input" type="text" id="msg" placeholder="메시지를 입력해 주세요" onkeyup="chatEnterkey()"/>
              <button class="my_btn" id="button-talk-send">전송</button>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <!-- 모달창 이무니다  -->
     <div class="modal">
      <div class="modal_body">
        <b>정말 입찰 하시겠습니까?</b>
        <div class="modal_content">
          <div class="confirm_price_area">
            <b>1000000</b>
          </div>
          <div class="modal_btns">
            <button class="yes_btn">확인</button>
            <button class="close_btn">취소</button>
          </div>
        </div>
      </div>
    </div>
    
    
<%-- <script src="${pageContext.request.contextPath}/resources/js/test.js" defer=""></script> --%>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script type="text/javascript">
	var auctionPrevPrice = 100000;
	
	//writePrice();//시작할때 처음 제시가격 찍기
	
	//가격에 콤마 찍기
	function priceToString(price) {
	  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	//최고 가격 찍자
	function writePrice() {
	  $("#max_price").text(priceToString(auctionPrevPrice));
	}
	//채팅치고있을때 엔터 누르면 알아서 전송버튼 눌리게
	function chatEnterkey(){
		if (window.event.keyCode == 13) {
	    	// 엔터키가 눌렸을 때
	    	$("#button-talk-send").trigger("click");
	    }
	}
	//채팅전송 버튼 누르는 이벤트
	$("#button-talk-send").on("click", function (e) {
		const chat_content = $("#msg").val();
		$.ajax({
          type: "POST", //다른 서버로 보낼 때도 Post를 써야하나
          url: "http://127.0.0.1:5000/question",
          // data: GET은 전송할 http의 body가 없음. 그래서 data 필드가 필요없음
          // contentType: 전송할 data가 없으니까 그 data를 설명할 필드가 필요없음
          dataType: "text", // 목적: 파싱해줌. json데이터를 응답받으면 바이트스트링으로 들어옴. 응답받은 데이터는 json이 아니라 string이다. 그래서 json이 들어오면 자바스크립트 오브젝트로 파싱해줘야 함
          // dataType: 응답되는 데이터를 자바스크립트 오브젝트로 파싱하는 용도 text면 생략가능
          data: {
            content : chat_content, 
          },
          success: function (response) {
        	if(response == '1'){
        		console.log("질문입니다");	
        		sendMessage("QUESTION", chat_content);
        	}else{
        		console.log("질문이 아닙니다");
        		sendMessage("TALK", chat_content);
        	}
          },
          error: function(){
        	  alert("지금은 채팅 할 수 없어요");
          }
        });
		//잠시 꺼놓을께요
		//sendMessage("TALK", $("#msg").val());
 		$("#msg").val("");
	});
	
	var sock = new SockJS('http://localhost:8080/chatting');
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	sock.onopen = onOpen;
	
	function sendMessage(type, msg) {		
		var cur_id = '${userid}'; 
		
		var showLiveMessage = JSON.stringify({//object-> string으로 
				/* userName : cur_id, */
				message : msg,
				mType : type
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
			case 'QUESTION': case 'TALK':
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
				auctionPrevPrice = maxSuggestPrice;
				break
			case 'ENTER':
				var str =  
					`<div>
		              <b>\${message}</b>
		            </div>`
				$("#max_price").text(priceToString(maxSuggestPrice));
				$("#max_price_user").text(maxSuggestUser);
		        $("#connected_user").text(totalUser)
		        auctionPrevPrice = maxSuggestPrice;
		        console.log(auctionPrevPrice);
				break
			case 'LEAVE':
				var str = 
					`<div class='col-6'>
					<div class='alert alert-secondary'>
					<b>\${message}</b>
					</div></div>`
				$("#connected_user").text(totalUser)
				break
			case 'AUCTION_END':
				console.log("낙찰 완료 경매 종료"); 
				break
		}
		
		$("#message_box").append(str);
		//채팅창이 계속 올라갈떄  계속 아래로 보여지게 스크롤 조정 
		$("#message_box").scrollTop($("#message_box")[0].scrollHeight);
	}
	//채팅창에서 나갔을 때
	function onClose(evt) {
	
	}
	//채팅창에 들어왔을 때
	function onOpen(evt) {
		
	}
	
	//모달창 부분 이무니다====================
 	const body = document.querySelector("body");
    const modal = document.querySelector(".modal");
    const priceModalOpen = document.querySelector("#auction_btn");
    var modal_price = document.querySelector(".confirm_price_area b");
	const yes_btn_suggest = document.querySelector(".modal_btns .yes_btn");
	const close_btn_suggest = document.querySelector(".modal_btns .close_btn");
	
	//입찰 신청 버튼 눌렀을때 실행
    priceModalOpen.addEventListener("click", () => {
    	//새로운 제시 가격
	  	var mySuggestion = Number($("#auction_sugest").val());
	  	//이전 가격의 1/10 보다 높은지 확인 하고 제안을 받아들임
	  	if ( mySuggestion - auctionPrevPrice >= auctionPrevPrice / 10) {
	    	modal.classList.toggle("show");
	      	const my_suggest_price = priceToString(document.querySelector("#auction_sugest").value);
	      	modal_price.innerText = my_suggest_price;
	      	if (modal.classList.contains("show")) {
		        body.style.overflow = "hidden";
	      	}
		} else {
		  alert("이전 제시금액의 최소 1/10이상을 제시하셔야 합니다.");
		}
    	

    });
	//입찰신청 모달의 확인버튼 눌렸을떄
    yes_btn_suggest.addEventListener("click", () => {
    	var mySuggestion = $("#auction_sugest").val();
    	sendMessage("AUCTION", mySuggestion);
    	
    	modal.classList.toggle("show");
        if (modal.classList.contains("show")) {
          body.style.overflow = "hidden";
        }
        $("#auction_sugest").val("");
    });
  	//입찰신청 모달의 취소버튼 눌렸을떄
    close_btn_suggest.addEventListener("click", () => {
        modal.classList.toggle("show");
        if (modal.classList.contains("show")) {
          body.style.overflow = "hidden";
        }
    });

    modal.addEventListener("click", (event) => {
      if (event.target === modal) {
        modal.classList.toggle("show");

        if (!modal.classList.contains("show")) {
          body.style.overflow = "auto";
        }
      }
    });
    //모달모달=====================
</script>