<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!-- <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,300italic,700,700italic" />
CSS Reset
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.css" />
Milligram CSS
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/milligram/1.4.1/milligram.css" /> -->
<script src="https://web-broadcast.live-video.net/1.2.0/amazon-ivs-web-broadcast.js"></script>
<style>
/*     #preview {
      margin-bottom: 1.5rem;
      background: green;
      width: 100%;
      height: 100vh;
    } */
    
    
    .container {
        height: 100vh;
        width: 99%;
        font-size : 16px;
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
      .video_area #onAirStatus{
      	display:none;
      	background:red;
      	position: absolute;
      	width:50px;
      	top:40px;
      	right:10px;
      	border-radius:10px;
      	text-align:center;
      	color:white;
      	
      }
      .video_area .user_count{
      	position: absolute;
      	top:10px;
      	right:10px; 
      }
      .video_area .user_count p{
      	color:white;
      }
      .preview_container{
      	width:100%;
      	height:100%;
      }
      .preview_container #preview{
		margin-bottom: 1.5rem;
		background: green;
		width:100%;
		height:100%;
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
        display:flex;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      }
      .info_area .default_info{
      	flex:2;
      }
      .info_area .special_info{
      	flex:1;
      	display:flex;
      	flex-direction: column;
      }
      .info_area .special_info button{
        border: 0;
        border-radius: 5px;
        transition: all 0.2s;
      }
      .info_area .special_info button:hover {
        margin-top: -2px;
        margin-left: 0px;
        transform: scale(1.1, 1.1);
        -ms-transform: scale(1.1, 1.1);
        -webkit-transform: scale(1.1, 1.1);
      }
      .info_area .special_info #showlive_start{
      	background: #efe3ed;
      	border-radius: 15px;
      	width:200px;
      	height:50px;
      	flex:1;
      }
      .info_area .special_info #showlive_end{
      	background: #efe3ed;
      	border-radius: 15px;
      	width:200px;
      	height:50px;
      	flex:1;
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
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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
	    width:90%;
	    margin:0 auto;
	    /* margin-bottom:15px; */
	    padding:10px;
      }
      .auction_area_suggestion #auction_bid_success_btn{
      	flex:1;
      	background: #48665a;
        height: 50px;
        border: 0;
        border-radius: 15px;
        transition: all 0.2s;
      }
      .auction_area_suggestion #auction_bid_success_btn:hover{
      	margin-top: -2px;
        margin-left: 0px;
        transform: scale(1.1, 1.1);
        -ms-transform: scale(1.1, 1.1);
        -webkit-transform: scale(1.1, 1.1);
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
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      }
      /* .user_count{
      	
      	text-align:center;
      } */
      .tabs{
      	width: 100%;
        height: 80%;
      }
      .tabs .tabs_view{
      	height:15%;
      	width:100%;
      	display: flex;
      }
      .tabs .tabs_view .tab_item{
      	background : #efe3ed;
      	border-bottom:1px solid black;
      	text-align:center;
      	flex:1;
      	display : flex;
		justify-content : center;
		align-items : center;
		border-radius: 15px 15px 0 0;
      }
      .tabs .tabs_view .tab_item.selected{
      	background : #48665a;
      }
      .chat_view {
        /* background: #ffffff; */
        display:none;
        width: 100%;
        height:85%;
        padding: 10px;
        overflow-y: scroll;
      }
      .chat_view::-webkit-scrollbar {
		display: none; /* Chrome, Safari, Opera*/
	  }
      .chat_view.show{
      	display:block;
      }
      .chat_do {
      	display:flex;
        width: 100%;
        height: 20%;
        padding:20px;
      }
      .my_btn{
      border-radius: 15px;
      	background:#48665a;
      	width:30%;
      	margin : 0 auto;
      }
	/* 모달창 부분 이무니다 */
	  .commonmodal {
        position: absolute;
        z-index:100;
        top: 0;
        left: 0;

        width: 100%;
        height: 100%;

        display: none;

        background-color: rgba(0, 0, 0, 0.4);
      }
      .commonmodal.show {
        display: block;
      }
      .modal_body {
        position: absolute;
        top: 50%;
        left: 50%;

        width: 80%px;
        height: auto;

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
      .liveshow_start_modal_item{
      	display: flex;
        flex-direction: column;
      }    	
      .liveshow_start_modal_btns{
      	margin-top:15px;
      	width:100%;
      	display: flex;
      }
      .liveshow_start_modal_btns button{
      	color:white;
      	background:black;
      	width:40px;
      	height:30px;
      	flex:1;
      	border: 0;
        border-radius: 5px;
        transition: all 0.2s;
      }
      .liveshow_start_modal_btns button:hover {
        margin-top: -2px;
        margin-left: 0px;
        transform: scale(1.1, 1.1);
        -ms-transform: scale(1.1, 1.1);
        -webkit-transform: scale(1.1, 1.1);
        }
       .liveshow_end_modal_btns{
       	margin-top:15px;
      	display: flex;
       }
       .liveshow_end_modal_btns button{
       	color:white;
      	background:black;
      	width:40px;
      	height:30px;
      	flex:1;
      	border: 0;
        border-radius: 5px;
        transition: all 0.2s;
       }
       .liveshow_end_modal_btns button:hover{
      	margin-top: -2px;
        margin-left: 0px;
        transform: scale(1.1, 1.1);
        -ms-transform: scale(1.1, 1.1);
        -webkit-transform: scale(1.1, 1.1);
       }
      }
  </style>
</head>
<body> 
	<div class="container">
      <div class="showlive_container">
        <div class="left_area">
          <div class="video_area">
			<!-- Compositor preview -->
			<section class="preview_container">
			  <canvas id="preview"></canvas>
			</section>
			<div id=onAirStatus>
				LIVE
			</div>
			<div class="user_count" >
              <p>   시청자 : <b id="connected_user">0</b> 명</p>
            </div>
          </div>
          <div class="info_area">
          	<div class="default_info">
	          	<div class="room_title">${channelDTO.showlive_name}</div>
	          	<div class="room_product_name">${channelDTO.product_name}</div>
	          	<div class="room_bj">Bj : <b>${channelDTO.show_host}</b></div>
	          	<div class="room_start_time">${channelDTO.showlive_start_date}</div>
          	</div>
          	<div class="special_info">
          		<button id="showlive_start">방송 시작</button>
          		<button id="showlive_end">방송 종료</button>
          	</div>
          </div>
        </div>

        <div class="right_area">
          <div class="auction_area">
          	<div>
          		<p>닉네임 : <b id="max_price_user"></b></p>
          	</div>
            <div class="price_area">
	            <b> 최고제시가격 : </b></br>
	            <b id="max_price">${channelDTO.showlive_start_price}</b>
	            <b>원 </b>
            </div>
            
            <br />
            <div class="auction_area_suggestion">
	            <!-- <input type="number" max="2147483640"class="chat_input" id="auction_sugest" placeholder="입찰 가격을 제시해 주세요" /> -->
	            <button class="my_btn" id="auction_bid_success_btn">낙찰하기</button>
            </div>
          </div>
          <div class="chat_area">
          	<div class="tabs">
          		<div class="tabs_view">
	          		<!-- <input id="chat" type="radio" name="tab_item" checked> -->
				    <label class="tab_item selected" for="chat" id="message_tab">채팅</label>
				    <!-- <input id="programming" type="radio" name="tab_item"> -->
				    <label class="tab_item" for="question" id="question_tab">질문 모아보기</label>
			    </div>
	            <div class="chat_view show" id="message_box">
	            </div>
	            <div class="chat_view" id="question_box">
	            </div>
            </div>
            <div class="chat_do">
              <input class="chat_input" type="text" id="msg" placeholder="메시지를 입력해 주세요" onkeyup="chatEnterkey()"/>
              <button class="my_btn" id="button-talk-send">전송</button>
            </div>
          </div>
        </div>
      </div>
    </div>
    
   <!-- 방송 시작 모달창 이무니다  -->
   <div class="commonmodal" id="liveshow_start_modal">
      <div class="modal_body">
        <div class="modal_content">
          <!-- Error alert -->
			<section class="">
			  <h3 id="error"></h3>
			</section>
			
			<!--  Select -->
			<section class="liveshow_start_modal_item">
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
			 
			  <!-- Ingest Endpoint input -->
			 <section class="liveshow_start_modal_item">
			   <label for="ingest-endpoint">Ingest Endpoint</label>
			   <input type="text" id="ingest-endpoint" value="${channelDTO.aws_endpoint}" />
			 </section>
			
			 <!-- Stream Key input -->
			 <section class="liveshow_start_modal_item">
			   <label for="stream-key">Stream Key</label>
			   <input type="text" id="stream-key" value="${channelDTO.aws_stream_key}" />
			 </section>
			 
			 <!-- Broadcast buttons -->
			 <!-- <section class="liveshow_start_modal_item" style="disply:none;">
			   <button class="button" id="start" onclick="startBroadcast()">Start Broadcast</button>
			   <button class="button" id="stop" onclick="stopBroadcast()">Stop Broadcast</button>
			 </section> -->
			
			<!-- Data table -->
			 <section class="liveshow_start_modal_item">
			   <table id="data">
			     <tbody></tbody>
			   </table>
			 </section>
          <div class="liveshow_start_modal_btns">
          	<button class="leave_btn" id="liveshow_start_modal_start_btn">방송시작</button>
            <button class="leave_btn" id="liveshow_start_modal_cancle_btn">취소</button>
          </div>
        </div>
      </div>
    </div>
    <!-- 방송종료 모달 -->
    <div class="commonmodal" id="liveshow_end_modal">
      <div class="modal_body">
        <div class="modal_content">
          <b>정말 방송 종료하시겠습니까?</b>
          <div class="liveshow_end_modal_btns">
          	<button class="leave_btn" id="liveshow_end_modal_yes_btn">확인</button>
            <button class="leave_btn" id="liveshow_end_modal_no_btn">취소</button>
          </div>
        </div>
      </div>
    </div>
    <!-- 경매 낙찰시키기 모달 -->
    <div class="commonmodal" id="auction_bid_success_modal">
      <div class="modal_body">
        <div class="modal_content">
          <b>정말 낙찰 하시겠습니까?</b>
          <div class="liveshow_end_modal_btns">
          	<button class="leave_btn" id="auction_bid_success_yes_btn">확인</button>
            <button class="leave_btn" id="auction_bid_success_cancle_btn">취소</button>
          </div>
        </div>
      </div>
    </div>


<script src="${pageContext.request.contextPath}/resources/js/admin/showliveonair.js" defer=""></script>
</body>



<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script>
var success_bid_person = "";

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
//채팅보내기 버튼 눌리면 채팅 보내기
$("#button-talk-send").on("click", function (e) {
	const chat_content = $("#msg").val();
	sendMessage("TALK", chat_content);
	$("#msg").val("");
});

var sock = new SockJS('http://localhost:8080/BJchatting');
sock.onmessage = onMessage;
sock.onclose = onClose;
sock.onopen = onOpen;
function sendMessage(type, msg) {		
	var cur_id = '${userid}'; 
	
	var showLiveMessage = JSON.stringify({//object-> string�쇰� 
			/* userName : cur_id, */
			message : msg,
			mType : type
	})
	sock.send(showLiveMessage)
}

//서버에서 메시지를 받았을 때 -> 입장, 퇴장, 채팅, 질문, 경매 모두 이곳으로!
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
		case 'QUESTION': 
			var str = 
				`<div>
	              <p>\${username} : \${message}</p>
	            </div>`
	            
	        var question_str = 
				`<div>
	              <p>\${username} : \${message}</p>
	              <p>\${insertDate}</p>
	            </div>`
	        //질문 모아보기창에 우선 넣기
            $("#question_box").append(question_str);
        	//질문창이 계속 올라갈떄  계속 아래로 보여지게 스크롤 조정 
        	$("#question_box").scrollTop($("#question_box")[0].scrollHeight);
			break
		case 'TALK':
			if(username == cur_session){
				username = '나';
			}
			var str = 
				`<div>
	              <p>\${username} : \${message}</p>
	            </div>`
			break
		case 'AUCTION':
			$("#max_price").text(priceToString(maxSuggestPrice));
			$("#max_price_user").text(maxSuggestUser);
			success_bid_person = maxSuggestUser;
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
				`<div>
					<b>\${message}</b>
				</div>`
			$("#connected_user").text(totalUser)
			break
	}
	
	$("#message_box").append(str);
	//채팅창이 계속 올라갈떄  계속 아래로 보여지게 스크롤 조정 
	$("#message_box").scrollTop($("#message_box")[0].scrollHeight);
}
function onClose(evt) {
}
function onOpen(evt) {	
}

//버튼 이벤트
const auctionBidSuccessBtn = document.querySelector("#auction_bid_success_btn");
const auctionBidSuccessModal = document.querySelector("#auction_bid_success_modal");
const auctionBidSuccessModalYesBtn = document.querySelector("#auction_bid_success_yes_btn");
const auctionBidSuccessModalCancleBtn = document.querySelector("#auction_bid_success_cancle_btn");

//낙찰버튼 누르면 모달창 띄우기
auctionBidSuccessBtn.addEventListener("click", () => {
	auctionBidSuccessModal.classList.toggle("show");
    if (auctionBidSuccessModal.classList.contains("show")) {
      body.style.overflow = "hidden";
    }
});
//낙찰 모달에서 확인
auctionBidSuccessModalYesBtn.addEventListener("click", () =>{
	//만약 아직 아무도 입찰 제시 안했는데 낙찰하기 하면 alert창 띄우기
	if(success_bid_person == ""){
		alert("아직 제시한 사람이 없습니다");
		return
	}
	sendMessage('AUCTION_END', '');
	auctionBidSuccessModal.classList.toggle("show");
    if (auctionBidSuccessModal.classList.contains("show")) {
      body.style.overflow = "hidden";
    }
    auctionBidSuccessBtn.style.backgroundColor="black";
    auctionBidSuccessBtn.disabled=true;
});
//낙찰 모달에서 취소
auctionBidSuccessModalCancleBtn.addEventListener("click", () =>{
	auctionBidSuccessModal.classList.toggle("show");
    if (auctionBidSuccessModal.classList.contains("show")) {
      body.style.overflow = "hidden";
    }
});

//메시지, 질문탭
const messageTab = document.querySelector("#message_tab");
const questionTab = document.querySelector("#question_tab");


messageTab.addEventListener("click", () => {
	console.log("탭누리1");
	messageTab.classList.add("selected");
	questionTab.classList.remove("selected");
	
	$("#message_box").addClass("show");
	$("#question_box").removeClass("show");
	
	if($("#question_box").hasClass("show")){
		$("#question_box").toggleClass("show");
	}
});
questionTab.addEventListener("click", () => {
	console.log("탭누리2");
	questionTab.classList.add("selected");
	messageTab.classList.remove("selected");
	
	$("#question_box").addClass("show");
	$("#message_box").removeClass("show");
	
	if($("#message_box").hasClass("show")){
		$("#message_box").toggleClass("show");
	}
});

//모달모달 ~~
const onAirModalOpenBtn = document.querySelector("#showlive_start");						//방송하기 모달여는 버튼
const onAirEndMoalOpenBtn = document.querySelector("#showlive_end");						//방송안하기 모달여는 버튼

const onAirModal = document.querySelector("#liveshow_start_modal");							//방송하기 모달
const onAirStartBtn = document.querySelector("#liveshow_start_modal_start_btn");			//방송시작 버튼
const onAirModalCloseBtn = document.querySelector("#liveshow_start_modal_cancle_btn");		//방송하기 모달 닫기

const onAirEndModal = document.querySelector("#liveshow_end_modal");						//방송종료 모달
const onAirEndBtn = document.querySelector("#liveshow_end_modal_yes_btn");					//방송종료 확인버튼
const onAirEndModalCloseBtn = document.querySelector("#liveshow_end_modal_no_btn");			//방송종료 모달 닫기 버튼

const onAirStatus = document.querySelector("#onAirStatus");

onAirModalOpenBtn.addEventListener("click", () => {			//방송하기 모달여는 버튼눌렸을때
	onAirModal.classList.toggle("show");
    if (onAirModal.classList.contains("show")) {
      body.style.overflow = "hidden";
    }
});
onAirStartBtn.addEventListener("click", () => {				//방송하기 버튼 눌렀을때 AWS 방송시작
	onAirModal.classList.toggle("show");
    if (onAirModal.classList.contains("show")) {
      body.style.overflow = "hidden";
    }
    onAirStatus.style.display = "block";//방송 시작하면 오른쪽 상단에 라이브 상태 뜨게
	startBroadcast()
});
onAirModalCloseBtn.addEventListener("click", () => {		//방송하기 모달 닫기버튼 눌렸을때
	onAirModal.classList.toggle("show");
    if (onAirModal.classList.contains("show")) {
      body.style.overflow = "hidden";
    }
});
onAirEndMoalOpenBtn.addEventListener("click", () => {		//방송종료 모달버튼 눌렀을때
	onAirEndModal.classList.toggle("show");
    if (onAirEndModal.classList.contains("show")) {
      body.style.overflow = "hidden";
    }
});
onAirEndBtn.addEventListener("click", () => {				//방송종료 버튼 눌렸을떄 AWS 방송 종료 및 admin/amin 페이지로 이동
	stopBroadcast();
	onAirStatus.style.display = "none";//방송 끄면하면 오른쪽 상단에 라이브 상태 없어지게
	console.log("방송종료");
	onAirEndModal.classList.toggle("show");
    if (onAirEndModal.classList.contains("show")) {
      body.style.overflow = "hidden";
    }
    location.href="main";
});
onAirEndModalCloseBtn.addEventListener("click", () => {		//방송종료 모달 닫기 버튼 눌렸을 때
	onAirEndModal.classList.toggle("show");
    if (onAirEndModal.classList.contains("show")) {
      body.style.overflow = "hidden";
    }
});
</script>

</html>