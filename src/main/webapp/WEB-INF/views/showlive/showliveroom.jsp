<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<script src="${pageContext.request.contextPath}/resources/js/confetti_v2.js"></script>
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
      .video_area #player-ready{
		position: absolute;
		top:0;
		left:0;
      	z-index:5;
      	display : flex;
		justify-content : center;
		align-items : center;
		background : white;
		font-size :50px;
      }
      .video_area .user_count{
      	position: absolute;
      	top:10px;
      	right:10px;
      	z-index:10;
      }
      .video_area .user_count p{
      	color:white;
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
        height: 80%;
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
      
	  .modal {
        position: absolute;
        z-index:99;
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
        background: #48665a;
      }
      .modal_body .modal_btns button.close_btn {
        background: #efe3ed;
      }
      .modal_body .modal_btns button.leave_btn {
        background: red;
      }
      .modal_body .modal_btns button:hover {
        margin-top: -2px;
        margin-left: 0px;
        transform: scale(1.1, 1.1);
        -ms-transform: scale(1.1, 1.1);
        -webkit-transform: scale(1.1, 1.1);
        /* box-shadow: 0px 5px 5px -2px rgba(85, 197, 150, 0.25); */
      }
      
      /* 경매 낙찰 후 폭죽효과 */
      canvas {
            z-index: 10;
            pointer-events: none;
            position: fixed;
            top: 0;
            transform: scale(1.1);
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
            <div class="user_count" >
              <p>   사용자 : <b id="connected_user">0</b> 명</p>
            </div>
            <div id="player-ready" style="width:100%; height:100%;">
            	방송 준비중입니다.
            </div>
          </div>
          <div class="info_area">
          	<a id="macro" href="javascript:void(0);"><div class="room_title">${channelDTO.showlive_name}</div></a>
          	<div class="room_product_name">${channelDTO.product_name}</div>
          	<div class="room_bj">Bj : <b>${channelDTO.show_host}</b></div>
          	<div class="room_start_time">${channelDTO.showlive_start_date}</div>
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
	            <b>원 </b>
            </div>
            
            <br />
            <div class="auction_area_suggestion">
	            <input type="number" max="2147483640"class="chat_input" id="auction_sugest" placeholder="입찰 가격을 제시해 주세요" />
	            <button class="my_btn" id="auction_btn">입찰신청</button>
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
              <!-- <input class="chat_input" type="text" id="msg" placeholder="메시지를 입력해 주세요" onkeyup="chatEnterkey()"/> -->
              <textarea rows="5" cols="40" class="chat_input" type="text" id="msg" placeholder="메시지를 입력해 주세요" onkeyup="chatEnterkey()" ></textarea>
              <button class="my_btn" id="button-talk-send">전송</button>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <!-- 입찰 신청 모달창 이무니다  -->
     <div class="modal">
      <div class="modal_body">
        <b>정말 입찰 하시겠습니까?</b>
        <div class="modal_content">
          <div class="confirm_price_area">
            <b></b>
          </div>
          <div class="modal_btns">
            <button class="yes_btn">확인</button>
            <button class="close_btn">취소</button>
          </div>
        </div>
      </div>
    </div>
    <!-- 입찰 신청 모달창 이무니다  -->
     <div class="commonmodal" id="leave_modal">
      <div class="modal_body">
        <div class="modal_content">
          <div class="confirm_price_area" style="font-size:30px;">
            <b>방송이 종료되었습니다</b>
          </div>
          <div class="modal_btns">
            <button class="leave_btn">나가기</button>
          </div>
        </div>
      </div>
    </div>
    <!-- 낙찰 모달창 이무니다  -->
     <div class="commonmodal" id="bidding_modal">
      <div class="modal_body">
      	<b>축하합니다</b>
        <div class="modal_content">
          <div class="confirm_price_area" style="font-size:30px;">
            <p><b id="final_bider"></b> 님이 낙찰 되었습니다</p>
          </div>
          <!-- <div class="modal_btns">
            <button class="leave_btn">나가기</button>
          </div> -->
        </div>
      </div>
    </div>
    <!-- 낙찰 후 폭죽 터지는 효과를 위한 친구들 -->
	<div class="buttonContainer" style="display: none;">
        <button class="canvasBtn" id="stopButton">Stop Confetti</button>
        <button class="canvasBtn" id="startButton">Drop Confetti</button>
    </div>
    <canvas id="canvas"></canvas>
    
    <input type="text" id="playbackUrl" value="${channelDTO.aws_channel_url}"/>
    
<%-- <script src="${pageContext.request.contextPath}/resources/js/test.js" defer=""></script> --%>
<script src="${pageContext.request.contextPath}/resources/js/watchlive.js" defer=""></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script type="text/javascript">
	var auctionPrevPrice = 100000;
	
	const chat_log = [];										//채팅저장배열
	const chatBtn = document.getElementById("button-talk-send");//채팅버튼
	
	//writePrice();//시작할때 처음 제시가격 찍기
	
	//가격에 콤마 찍기
	function priceToString(price) {
	  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	//최고 가격 찍자
	function writePrice() {
	  $("#max_price").text(priceToString(auctionPrevPrice));
	}
	//가격 제시할때 제한 금액 이상 못적게 하기
	$("#auction_sugest").keyup(function(){
		if($("#auction_sugest").val() > 2147483640){
			$("#auction_sugest").val(2147483640);
		}
	})
	
	//채팅치고있을때 엔터 누르면 알아서 전송버튼 눌리게
	function chatEnterkey(){
		if (window.event.keyCode == 13) {
	    	// 엔터키가 눌렸을 때
	    	$("#button-talk-send").trigger("click");
	    }
	}
	//채팅전송 버튼 누르는 이벤트
	$("#button-talk-send").on("click", function (e) {
		if(chatRestrict()){
			const chat_content = $("#msg").val();
			$.ajax({
	          type: "POST", //다른 서버로 보낼 때도 Post를 써야하나
	          //url: "http://192.168.0.14:5000/question",
	          url: "http://10.109.118.229:5050/question",
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
		}
		$("#msg").val("");
	});
	//5개 연속을 3초안에 하면 채팅 금지!!! 3초간
	function chatRestrict(){
		chat_log.push(new Date());
		if (chat_log.length > 4) {
		  chat_log.shift();
		  console.log(
		    chat_log[chat_log.length - 1].getTime() - chat_log[0].getTime()
		  );
		  console.log(chat_log);
		  //5개 연속이 3초 이상이면 10초간 채팅전송버튼 금지
		  if (chat_log[chat_log.length - 1].getTime() - chat_log[0].getTime() < 3000) {
			chatBtn.disabled = true;
			$("#msg").attr("placeholder", "채팅 그만해 이놈들아");
		    setTimeout(function () {
	    		chatBtn.disabled = false;
	    		$("#msg").attr("placeholder", "메시지를 입력해 주세요");
		    }, 3000);
		    return 0;
		  }
		}
		return 1;
	}
	//폭죽 날리기~
	/* const sbmodal = document.querySelector("#bidding_modal"); */
	function reAction() {
        $("#startButton").trigger("click");
        $("#bidding_modal").toggle("show");
        setTimeout(function () {
            $("#stopButton").trigger("click");
            $("#bidding_modal").toggle("show");
        }, 6000);
    }
	var sock = new SockJS('/chatting');
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
		var auctionYn = messageData['auctionYn'];
		
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
				$("#final_bider").text(maxSuggestUser);
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
		        
		        if(auctionYn == 'yes'){
		        	$("#auction_sugest").attr("placeholder", "경매가 종료 되었습니다.");
		        	$("#auction_btn").attr("disabled",true);
		        	$("#auction_btn").css("background","black");
		        }
		        console.log(auctionPrevPrice);
				break
			case 'LEAVE':
				var str = 
					`<div>
						<b>\${message}</b>
					</div>`
				$("#connected_user").text(totalUser)
				break
			case 'AUCTION_END':
				reAction();
				if(auctionYn == 'yes'){
		        	$("#auction_sugest").attr("placeholder", "경매가 종료 되었습니다.");
		        	$("#auction_btn").attr("disabled",true);
		        	$("#auction_btn").css("background","black");
		        }
				break
			case 'LIVE_END':
				$("#leave_modal").toggle("show");
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
	
	//입찰 신청모달창 부분 이무니다====================
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
	  		
	  		//가격 제시할때 제한 금액 이상 못적게 하기
  			if($("#auction_sugest").val() > 2147483640){
  				$("#auction_sugest").val(2147483640);
  			}
	  		
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
   	//입찰 신청모달창 부분 이무니다====================
	const leave_btn = document.querySelector(".leave_btn");
	leave_btn.addEventListener("click", () => {
    	console.log("신난당");
    	location.href="/";
    });
	//모달모달=====================
		
		
	// 자동 채팅 메크로 부분
	const myChatStr = `1빠 안녕하세요~~
2빠 입장했습니다@@@
3빠 더함 유하~~~
우와 이건 무슨서비스예요~~~~~
안녕하세요 반갑습니다!!!
오 된장포스~~~~
나이키는 믿고 보는 브랜드
이건 내가 무조건 산다
배송은 얼마나 걸리나요?
현대백화점 최고!!!
아디다스도 했으면 좋겠다ㅜㅜ
쇼호스트 이뻐요
쇼호스트 옆에분 귀엽게 생겼어요
신발끈 묶는 방법 알려주세요
역대급 콜라보네 베리굿~~~~
제 질문 답변좀 해주세요 ㅠㅠ
신발 너무 이쁘다
다른 브랜드도 해주세요
낙찰되면 수수료는 얼마나 내나요?
채팅수 빠르게 올라가는 거봐 대박
여기 리셀도하던데 이건 무슨서비스야 대박
된장포스와 청바지의 조합은 무조건이지
비닐 한번만 뜯어서 보여주세요
제품의 원가는 얼마인가요?
퀄리티가 소화못할꺼 같아서 미치겠는데   
다른 제품도 입어봐주세요    
​이거 진짜 이쁨 사면 후회안합니다   
이거 입고 학교가면 인싸될듯;  
지금같이 추운 날씨에 입으면 추워죽겠다  
옷 너무 예뻐요. 잘어울린다ㅎㅎ  
얼굴 몸매가 다 받쳐주니 뭘 입어도 여신이네.. 부럽습니다 
패션의 완성 몸매..뭘입어도 의미없음..다이쁨 
전엔 옷만 입었는데 이렇게 자세히 설명 해 주시니 좋으네요
이건 무신사보다 싼거 맞음 살거면 지금사는게 좋을듯 
이거 진짜 길에서 꼭 보는 티셔츠ㅋㅋㅋ   
​스트릿느낌 졸네요
​여기 브랜드 맨투맨도 좋음  
​2만원이면 살듯
이만이천은 뭐냐 채팅ㅋㅋㅋㅋㅋㅋㅋ어우  
호스트 발성 딕션 미쳤네
호스트분이 고생이 많으시네요    
​공개 전부터 품절이었음 
가격 좋은고 진짜 예쁜데 나는 스타일이 달라서 아쉽네 
이쁘긴하다  
​아니근데 너무이쁜데?   
진행 너무 잘한다 !! 
​플랙처럼 제대로 할인해서 나오면 채팅창 난리 안 나지
​저거 필요하면 살만하긴 할듯
fw시즌때 올라올때까지 존버나 해야지
누나 타투 읏된다 ㄷㄷ   
​빡세다 저건 ㅋㅋㅋ 
​ㄹㅇ 이쁜데?   
​넘 화려하네요ㅎㅎ..    
​초록색 너무 마음에 든다
​이거 인기 많아요   
잘입으면 다른사람들 압살할 거 같긴 함  
저번에 깡형이 추천해주신건데
​와 근데 무슨 현대 미술 보는 느낌이다 ㅋㅋㅋㅋㅋ    
그냥 아무렇게 입어도 바캉스룩
물량 넘적어요
​아니근데 조온나 이쁘다
아니 불편하면 나가라    
말장난하네   
​5000원이면 좋겠다.
무신사가 더 비싼ㄷ[?    
사고 생각하자 재고 없다
예쁜데 나랑 안 맞는듯   
이것도 진짜 싼거지 저정도 퀄리티에  
정신차려 패션의 완성은 얼굴이야 
무신사에서 쿠폰먹이면 비슷  
좀 무거워 보여요 무겁지 않나요
가격이 거의그대로네
재고 털려는 마음이 덜한듯.. 그냥 내년에 다시 팔겠다는 가격..    
​주머니 왜저렇게생김    
예쁜데? 
​원래 장사는 절대 손해 안 본다  
매너 채팅 좀 해 
응안사  
레알 저렴하네 ㄷㄷㄷㄷ  
​핏이 넘 어벙해
여긴 몇개 안하넹... 
니트 짧게 입고 롱슬리브 해도 이쁘네 
​군번줄메고오셧농   
디자인은 빡센딩 
코디하기 쉽진 않을 것 같긴하네요    
​그냥 사고생각해야지    
패딩에 저거 하나 입으면 끝이다 ㄹㅇ 
​저기다가 아우터는 뭐입어요 
바로 질럿다;    
​가격착하다 
​이건 무조건 사러감 ㄹㅇ뚜루빵삥뽕   
어쩔수없이 이뻐요
사이즈가 적힌것보다 커보이는데 미국 표기인가요?
착샷 보고싶어요
​영업은 화끈 하게 해야죠 ^^ 
비싸다   
​해줘 컨텐츠 개웃기네   
공홈 렉 장난아니에요    
​나중에 살걸…
​너무 얇아보이는데.. 
ㅋㅋㅋㅋ호스트 잘하시네  
20이면 산다 
​진짜 아무리 봐도 홈쇼핑 감성인데ㅋㅋㅋㅋㅋ
활용 어려울 듯  
​화끈하게 5마넌으로 해줘요  
천원으로 하면 가성비 ㅇㅈ
오늘 마지막이여도 안산다
​ㅇㅈ합니다 
힘들어보인다....... 
​5만원에 해주세요   
솔직히 이건 개혜자  
가격 말이 안대는데  
​팀장님의 파워를 보여줘 ~ 팀장님의 파워를 보여줘!
​이 집 방송 잘하넹
​수능 끝 너무좋당ㅠㅠ   
옷입다 시간 다가겠누    
개웃기넽ㅋㅋㅋㅋ    
​이색깔이 더 이쁘다 
​계속 두번씩 말해ㅋㅋㅋㅋ 긴장하셨어
카키가 예쁘네   
오 진짜 이쁘넨  
목괜찮습니까 천천히 말해두되요
이거는 괜찮은듯 
이거 있는데 후드랑 매치하면 존예임  
        `;

  const chatList = myChatStr.split("\n");
  const chatListSize = chatList.length;
  var idx = 0;
  $("#macro").click(function(){
	  chatMacro = setInterval(function () {
		    if (idx < chatListSize - 1) {
		      console.log(chatList[idx]);
		      const curIdx = idx;
		      $.ajax({
		          type: "POST", //다른 서버로 보낼 때도 Post를 써야하나
		          //url: "http://192.168.0.14:5000/question",
		          url: "http://10.109.118.229:5050/question",
		          // data: GET은 전송할 http의 body가 없음. 그래서 data 필드가 필요없음
		          // contentType: 전송할 data가 없으니까 그 data를 설명할 필드가 필요없음
		          dataType: "text", // 목적: 파싱해줌. json데이터를 응답받으면 바이트스트링으로 들어옴. 응답받은 데이터는 json이 아니라 string이다. 그래서 json이 들어오면 자바스크립트 오브젝트로 파싱해줘야 함
		          // dataType: 응답되는 데이터를 자바스크립트 오브젝트로 파싱하는 용도 text면 생략가능
		          data: {
		            content : chatList[curIdx], 
		          },
		          success: function (response) {
		        	if(response == '1'){
		        		console.log("질문입니다");	
		        		sendMessage("QUESTION", chatList[curIdx]);
		        	}else{
		        		console.log("질문이 아닙니다");
		        		sendMessage("TALK", chatList[curIdx]);
		        	}
		          },
		          error: function(){
		        	  alert("지금은 채팅 할 수 없어요");
		          }
		        });
		      idx++;
		    } else {
		      console.log("끝");
		      clearInterval(chatMacro);
		    }
		  }, 300);
  });

</script>